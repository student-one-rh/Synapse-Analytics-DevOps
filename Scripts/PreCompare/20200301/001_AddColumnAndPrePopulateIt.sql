/* Add target column as nullable since we already have data on the table */
IF EXISTS(
            SELECT table_name 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE 
                table_schema = 'dbo'
                AND table_name = 'DimCustomer'
                AND column_name = 'TravelPreferenceKey2'
          )
    BEGIN
        PRINT 'Column TravelPreferenceKey2 already exists';
    END
ELSE
    BEGIN
        PRINT 'Column TravelPreferenceKey2 doesn''t exist, creating it...';
        ALTER TABLE dbo.DimCustomer 
            ADD TravelPreferenceKey2 INT NULL;
        PRINT 'Done with creating column TravelPreferenceKey2'
    END

    /* Update logic to ensure every row is populated */

    /* Now SSDT will make it nullable after the diff */