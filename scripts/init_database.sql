/*
=========================================================================================================================================
=========================================================================================================================================
Create Database & Schemas
=========================================================================================================================================
=========================================================================================================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists then it will be dropped and recreated.
    Additionally, the scripts sets up three schemas within the database: 'bronze', 'silver' and 'gold'.

Warning:
    Running the script will drop entire the 'DataWarehouse' if it exists.
    All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups before running the script.
*/

USE master;
GO

-- Drop and recreate the database 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the Database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
