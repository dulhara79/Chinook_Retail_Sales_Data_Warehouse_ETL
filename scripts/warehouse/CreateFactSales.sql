USE Chinook_DW
GO

DROP TABLE IF EXISTS dbo.FactSales;
GO

--DROP PROCEDURE IF EXISTS dbo.UpdateFactSales;
--GO

CREATE TABLE dbo.FactSales (
    SalesSK INT IDENTITY(1,1) NOT NULL,
    AlternateInvoiceId INT NOT NULL,
    CustomerSK INT NOT NULL,
    EmployeeSK INT NULL,
    TrackSK INT NOT NULL,
    ArtistSK INT NOT NULL,
    DateSK INT NOT NULL,
    InvoiceDate DATETIME NOT NULL,
    BillingAddress NVARCHAR(70) NULL,
    BillingCity NVARCHAR(40) NULL,
    BillingState NVARCHAR(40) NULL,
    BillingPostalCode NVARCHAR(10) NULL,
    BillingCountry NVARCHAR(40) NULL,
    Total NUMERIC(10,2) NOT NULL,
    Quantity INT NOT NULL,

    -- Measures
    UnitPrice AS (CASE WHEN Quantity > 0 THEN Total / Quantity ELSE 0 END) PERSISTED,
    TaxAmount AS (Total * 0.10) PERSISTED,
    DiscountAmount AS (
        CASE 
            WHEN Quantity >= 10 THEN Total * 0.15
            WHEN Quantity >= 5 THEN Total * 0.05
            ELSE 0 
        END
    ) PERSISTED,
    NetSales AS (
        CASE 
            WHEN Quantity >= 10 THEN Total - (Total * 0.15)
            WHEN Quantity >= 5 THEN Total - (Total * 0.05)
            ELSE Total 
        END
    ) PERSISTED,

    InsertDate DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_FactSales_Customer FOREIGN KEY (CustomerSK) REFERENCES dbo.DimCustomer(CustomerSK),
    CONSTRAINT FK_FactSales_Employee FOREIGN KEY (EmployeeSK) REFERENCES dbo.DimEmployee(EmployeeSK),
    CONSTRAINT FK_FactSales_Track FOREIGN KEY (TrackSK) REFERENCES dbo.DimTrack(TrackSK),
    CONSTRAINT FK_FactSales_Artist FOREIGN KEY (ArtistSK) REFERENCES dbo.DimArtist(ArtistSK)
);
GO
