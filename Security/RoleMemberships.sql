EXECUTE sp_addrolemember @rolename = N'db_ddladmin', @membername = N'ingest-to-lake-dev-01';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'ingest-to-lake-dev-01';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'ingest-to-lake-dev-01';

