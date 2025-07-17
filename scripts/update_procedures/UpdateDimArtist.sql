USE Chinook_DW
GO

CREATE PROCEDURE dbo.UpdateDimArtist
    @ArtistId INT,
    @ArtistName NVARCHAR(120)
AS
BEGIN
    IF NOT EXISTS (SELECT ArtistSK FROM dbo.DimArtist WHERE AlternateArtistId = @ArtistId)
    BEGIN
        INSERT INTO dbo.DimArtist (AlternateArtistId, ArtistName, InsertDate, ModifiedDate)
        VALUES (@ArtistId, @ArtistName, GETDATE(), GETDATE());
    END;
    IF EXISTS (SELECT ArtistSK FROM dbo.DimArtist WHERE AlternateArtistId = @ArtistId)
    BEGIN
        UPDATE dbo.DimArtist
        SET ArtistName = @ArtistName,
            ModifiedDate = GETDATE()
        WHERE AlternateArtistId = @ArtistId;
    END;
END;
GO