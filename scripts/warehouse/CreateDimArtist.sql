USE Chinook_DW
GO

DROP TABLE IF EXISTS dbo.DimArtist;
GO

CREATE TABLE dbo.DimArtist (
    ArtistSK INT IDENTITY(1,1) NOT NULL,
    AlternateArtistId INT NOT NULL,
    ArtistName NVARCHAR(120) NOT NULL,
    InsertDate DATETIME NOT NULL DEFAULT GETDATE(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_DimArtist PRIMARY KEY (ArtistSK),
    CONSTRAINT UQ_DimArtist_AlternateId UNIQUE (AlternateArtistId)
);
GO