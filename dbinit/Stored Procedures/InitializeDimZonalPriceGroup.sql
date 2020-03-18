CREATE PROC [dbinit].[InitializeDimZonalPriceGroup] AS
BEGIN
    /* Create temporary table to hold reference data */
    RAISERROR('Creating table with reference data for DimZonalPriceGroup', 10, 1);

    IF OBJECT_ID('tempdb..#ZonalPriceGroup') IS NOT NULL
    BEGIN
        DROP TABLE #ZonalPriceGroup
    END

    /* Copy Schema */
    SELECT * 
    INTO #ZonalPriceGroup
    FROM [dbo].[DimZonalPriceGroup]
    WHERE 1=0;

    SET NOCOUNT ON;
    INSERT #ZonalPriceGroup ([ZonalPriceGroupKey], [ZonalPriceGroupName]) VALUES (1, 'North America');
    INSERT #ZonalPriceGroup ([ZonalPriceGroupKey], [ZonalPriceGroupName]) VALUES (2, 'Central and South America');
    INSERT #ZonalPriceGroup ([ZonalPriceGroupKey], [ZonalPriceGroupName]) VALUES (3, 'Asia Pacific');
    INSERT #ZonalPriceGroup ([ZonalPriceGroupKey], [ZonalPriceGroupName]) VALUES (4, 'EMEA');
    SET NOCOUNT OFF;

    /* Update non-key columns for existing keys */
    RAISERROR('Updating ZonalPriceGroupKey', 10, 1);
    UPDATE DimZonalPriceGroup
    SET 
      [DimZonalPriceGroup].[ZonalPriceGroupName] = [#ZonalPriceGroup].[ZonalPriceGroupName]
    FROM #ZonalPriceGroup 
    WHERE 
        #ZonalPriceGroup.[ZonalPriceGroupKey] = [DimZonalPriceGroup].[ZonalPriceGroupKey] AND
        #ZonalPriceGroup.[ZonalPriceGroupName] <> [DimZonalPriceGroup].[ZonalPriceGroupName]

    /* Insert rows that do not exist yet */
    RAISERROR('Inserting rows for ZonalPriceGroupKey', 10, 1);
    INSERT [dbo].[DimZonalPriceGroup] ([ZonalPriceGroupKey], [ZonalPriceGroupName]) 
      SELECT s.[ZonalPriceGroupKey], s.[ZonalPriceGroupName]
      FROM #ZonalPriceGroup s
      LEFT JOIN [dbo].[DimZonalPriceGroup] t ON s.[ZonalPriceGroupKey] = t.[ZonalPriceGroupKey]
      WHERE t.[ZonalPriceGroupKey] IS NULL

    IF OBJECT_ID('tempdb..#ZonalPriceGroup') IS NOT NULL
    BEGIN
        DROP TABLE #ZonalPriceGroup
    END

END