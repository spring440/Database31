REATE PROC selectPresentationsBySpeaker
  @speaker NVARCHAR(64)
AS
BEGIN
  BEGIN TRY
  SELECT
    Person.person_name,
    Presentation.title
  FROM Presentation
    INNER JOIN Presentation_Presenter ON Presentation.presentation_id = Presentation_Presenter.presentation_id
    INNER JOIN Presenter ON Presentation_Presenter.presenter_id = Presenter.presenter_id
    INNER JOIN Person ON Presenter.person_id = Person.person_id
  WHERE person_name = @speaker;
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

