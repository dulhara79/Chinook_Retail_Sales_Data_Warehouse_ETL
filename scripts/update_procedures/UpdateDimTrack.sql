USE Chinook_DW
GO

DROP PROCEDURE IF EXISTS dbo.UpdateDimTrack;
GO

CREATE PROCEDURE dbo.UpdateDimTrack
    @TrackId INT,
    @TrackName NVARCHAR(200),
    @AlbumTitle NVARCHAR(160),
    @ArtistId INT,
    @GenreName NVARCHAR(120),
    @MediaTypeName NVARCHAR(120),
    @PlayListName NVARCHAR(120),
    @Composer NVARCHAR(220),
    @UnitPrice NUMERIC(10,2),
    @Milliseconds INT,
    @Bytes INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDateTime DATETIME = GETDATE();

    IF NOT EXISTS (SELECT 1 FROM dbo.DimTrack WHERE AlternateTrackId = @TrackId)
    BEGIN
        -- Insert new record with merged data
        INSERT INTO dbo.DimTrack (AlternateTrackId, TrackName, AlbumTitle, ArtistId, GenreName, MediaTypeName, PlayListName, Composer, UnitPrice, Milliseconds, Bytes, InsertDate, ModifiedDate)
        VALUES (@TrackId, @TrackName, @AlbumTitle, @ArtistId, @GenreName, @MediaTypeName, @PlayListName, @Composer, @UnitPrice, @Milliseconds, @Bytes, @CurrentDateTime, @CurrentDateTime);
    END
    ELSE
    BEGIN
        -- Update existing record with merged data
        UPDATE dbo.DimTrack
        SET TrackName = @TrackName,
            AlbumTitle = @AlbumTitle,
            ArtistId = @ArtistId,
            GenreName = @GenreName,
            MediaTypeName = @MediaTypeName,
            PlayListName = @PlayListName,
            Composer = @Composer,
            UnitPrice = @UnitPrice,
            Milliseconds = @Milliseconds,
            Bytes = @Bytes,
            ModifiedDate = @CurrentDateTime
        WHERE AlternateTrackId = @TrackId;
    END
END;
GO