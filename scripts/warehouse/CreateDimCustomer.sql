USE Chinook_DW
GO

DROP TABLE IF EXISTS dbo.DimCustomer;
GO

DROP PROCEDURE IF EXISTS dbo.UpdateDimCustomer;
GO

CREATE TABLE dbo.DimCustomer (
    CustomerSK INT IDENTITY(1,1) NOT NULL,
    AlternateCustomerId INT NOT NULL,
	CustomerName NVARCHAR(200) NOT NULL, -- Adjust last name and first name together
    Company NVARCHAR(80) NULL,
    Address NVARCHAR(70) NULL,
    City NVARCHAR(40) NULL,
    State NVARCHAR(40) NULL,
    Country NVARCHAR(40) NULL,
    PostalCode NVARCHAR(10) NULL,
    Phone NVARCHAR(24) NULL,
    Fax NVARCHAR(24) NULL,
    Email NVARCHAR(60) NOT NULL,
    SupportRepId INT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
    InsertDate DATETIME NOT NULL DEFAULT GETDATE(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerSK),
    CONSTRAINT UQ_DimCustomer_AlternateId UNIQUE (AlternateCustomerId)
);
GO