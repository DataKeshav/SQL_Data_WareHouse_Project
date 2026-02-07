/*
==========================================
Create Database Schema
==========================================
Script Purpose:
      This scrpit creates a new database named 'DataWarehouse' after checking if it already exists.
      if the database exists. it is droped and recreated. additionlly, the script seta up three schemas.
      within the database: 'Bronze', 'Silver', 'Gold'.

Warning:
      Running this script will drop the entire 'DataWarehouse' database if it exists.
      All data in the database will be probably deleted. Proceed with caution
        znd ensurre you have proper backups before running this sripts.
*/

Use master;
Go

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
Go

-- Create the 'DataWarehouse' database
Create Database DataWarehouse;
Go
  
use DataWarehouse 
Go

  -- Create Schemas
Create Schema Bronze;
Go
  
Create Schema Silver;
Go
  
Create Schema Gold;
Go











