/*
=========================================================
stored Procedure: Load Bronze Layer (Source -> Bronze)
=========================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    it performs the following actions:
      - Truncates the bronze tables befor loading data.
      - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.

Parameters:
    None.
  This stored procedures does not accept any parameters or return any values.
Usage Examples:
    EXEC bronze.load_Bronze;
=========================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_Bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================';

		PRINT '--------------------------------';
		PRINT 'Loading Bronze CRM Tables';
		PRINT '--------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_cust_info';
		TRUNCATE TABLE Bronze.crm_cust_info;
		PRINT '>> Inserting Data into: Bronze.crm_cust_info';
		BULK INSERT Bronze.crm_cust_info
		FROM 'C:\Users\keshav pal\OneDrive\New folder\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_prd_info';
		TRUNCATE TABLE Bronze.crm_prd_info;
		PRINT '>> Inserting Data into: Bronze.crm_prd_info';
		BULK INSERT Bronze.crm_prd_info
		FROM 'C:\Users\keshav pal\OneDrive\New folder\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_sales_details';
		TRUNCATE TABLE Bronze.crm_sales_details;
		PRINT '>> Inserting Data into: Bronze.crm_sales_details';
		BULK INSERT Bronze.crm_sales_details
		FROM 'C:\Users\keshav pal\OneDrive\New folder\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------------------';


		
		PRINT '--------------------------------';
		PRINT 'Loading Bronze ERP Tables';
		PRINT '--------------------------------';
	
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_CUST_AZ12';
		TRUNCATE TABLE Bronze.erp_CUST_AZ12;
		PRINT '>> Inserting Data into: Bronze.erp_CUST_AZ12';
		BULK INSERT Bronze.erp_CUST_AZ12
		FROM 'C:\Users\keshav pal\OneDrive\New folder\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_LOC_A101';
		TRUNCATE TABLE Bronze.erp_LOC_A101;
		PRINT '>> Inserting Data into: Bronze.erp_LOC_A101';
		BULK INSERT Bronze.erp_LOC_A101
		FROM 'C:\Users\keshav pal\OneDrive\New folder\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE Bronze.erp_PX_CAT_G1V2;
		PRINT '>> Inserting Data into: Bronze.erp_PX_CAT_G1V2';
		BULK INSERT Bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\keshav pal\OneDrive\New folder\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------------------';

		SET @batch_end_time = GETDATE();
		PRINT '================================';
		PRINT 'Loading Bronze layer is Completed ';
		PRINT '		- Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time)AS NVARCHAR) + ' Seconds';
		PRINT '================================';
	END TRY
	BEGIN CATCH
		PRINT '========================='
		PRINT 'ERROR OCCURED DURING LOADING OF BRONZE LAYER'
		PRINT 'Error Message'+ Error_Message();
		PRINT 'Error Message'+ CAST(Error_number() as NVARCHAR);
		PRINT 'Error Message'+ CAST(Error_State() as NVARCHAR); 
		PRINT '========================='
	END CATCH
END
