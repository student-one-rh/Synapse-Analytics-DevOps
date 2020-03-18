/*
 Pre-Compare Script 
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before comparing the target
 environment with the project itself (the dacpac in the build).	
 Use SQLCMD syntax to include a file in this script. Place pre-compare scripts under
 the PreCompare folder.
 Example:      :r .\PreCompare\myfile.sql	
               :r .\PreCompare\20200301\001_AddColumnAndPrePopulateIt.sql
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]		
               
--------------------------------------------------------------------------------------
*/
RAISERROR( 'Starting Main Pre-Compare Script', 1, 10);

:r  $(ScriptsBasePath)\PreCompare\20200301\001_AddColumnAndPrePopulateIt.sql

RAISERROR('Ending Main Pre-Compare Script', 1, 10);
