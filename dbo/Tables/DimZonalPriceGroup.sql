CREATE TABLE [dbo].[DimZonalPriceGroup]
(
    [ZonalPriceGroupKey] int NOT NULL,
    [ZonalPriceGroupName] nvarchar(50) NULL
)
WITH
(
    DISTRIBUTION = HASH (ZonalPriceGroupKey),
    CLUSTERED COLUMNSTORE INDEX
)
GO
