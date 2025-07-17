USE Chinook_DW
GO

DROP TABLE IF EXISTS dbo.DimTrack;
GO

CREATE TABLE dbo.DimTrack (
    TrackSK INT IDENTITY(1,1) NOT NULL,
    AlternateTrackId INT NOT NULL,
    TrackName NVARCHAR(200) NOT NULL,
    AlbumTitle NVARCHAR(160) NOT NULL,
    ArtistId INT NOT NULL,
    GenreName NVARCHAR(120) NOT NULL,
    MediaTypeName NVARCHAR(120) NOT NULL,
    PlayListName NVARCHAR(120) NULL,
    Composer NVARCHAR(220) NULL,
    UnitPrice NUMERIC(10,2) NOT NULL,
    Milliseconds INT NOT NULL,
    Bytes INT NOT NULL,
    InsertDate DATETIME NOT NULL DEFAULT GETDATE(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_DimTrack PRIMARY KEY (TrackSK),
    CONSTRAINT UQ_DimTrack_AlternateId UNIQUE (AlternateTrackId),
);
GO