USE Chinook_DW
GO

DROP TABLE IF EXISTS dbo.DimEmployee;
GO

--DROP PROCEDURE IF EXISTS dbo.UpdateDimEmployee;
--GO

CREATE TABLE dbo.DimEmployee (
    EmployeeSK INT IDENTITY(1,1) NOT NULL,
    AlternateEmployeeId INT NOT NULL,
	EmployeeName NVARCHAR(100) NOT NULL,
    Title NVARCHAR(30) NULL,
    ReportsTo INT NULL,
    BirthDate DATETIME NULL,
    HireDate DATETIME NULL,
    Address NVARCHAR(70) NULL,
    City NVARCHAR(40) NULL,
    State NVARCHAR(40) NULL,
    Country NVARCHAR(40) NULL,
    PostalCode NVARCHAR(10) NULL,
    Phone NVARCHAR(24) NULL,
    Fax NVARCHAR(24) NULL, 
    Email NVARCHAR(60) NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
    InsertDate DATETIME NOT NULL DEFAULT GETDATE(),
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_DimEmployee PRIMARY KEY (EmployeeSK),
    CONSTRAINT UQ_DimEmployee_AlternateId UNIQUE (AlternateEmployeeId)
);
GO