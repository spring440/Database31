ALTER PROC dbo.selectPresentationsByTrackAndCity
  @trackNum INT = 1,
  @cityName VARCHAR(64) = 'Budapest'
AS
BEGIN TRY
SELECT
  Track.track_id,
  Presentation.title,
  Venues.venue_city
FROM Presentation
  INNER JOIN Venues ON Presentation.venue_id = Venues.venue_id
  INNER JOIN Lecture_Times ON Presentation.presentation_id = Lecture_Times.presentation_id
  INNER JOIN Track ON Lecture_Times.track_id = Track.track_id
  INNER JOIN Lecture_Hall ON Lecture_Times.room_id = Lecture_Hall.room_id
WHERE venue_city = @cityName AND Track.track_id = @trackNum;
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
GO

