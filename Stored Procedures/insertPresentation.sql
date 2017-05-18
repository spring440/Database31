ALTER PROC dbo.insertPresentation
  @speaker      NVARCHAR(64),
  @presentation VARCHAR(256)
AS
BEGIN
  BEGIN TRY
  --if first name and last name are not in person table
  IF NOT EXISTS(SELECT person_name
                FROM Person
                WHERE person_name = @speaker)
    BEGIN
      INSERT INTO person VALUES (@speaker);
      INSERT INTO Presenter (person_id) VALUES ((SELECT Person.person_id
                                                 FROM Person
                                                 WHERE person_name = @speaker));
    END

  -- if @presentation is not in the title of presentation
  IF NOT EXISTS(SELECT title
                FROM Presentation
                WHERE title = @presentation)
    BEGIN
      INSERT INTO Presentation (title) VALUES (@presentation);
    END

  BEGIN
    INSERT INTO Presentation_Presenter VALUES ((SELECT presenter_id
                                                FROM Presenter
                                                  INNER JOIN Person ON Presenter.person_id = Person.person_id
                                                WHERE Person.person_name = @speaker), (SELECT presentation_id
                                                                                       FROM Presentation
                                                                                       WHERE title = @presentation));
  END

  END TRY
  BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH

END
GO

