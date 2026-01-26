exec bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @Start_time DATETIME , @End_time DATETIME , @batch_start_time DATETIME , @batch_end_time DATETIME ; 
	BEGIN TRY
		SET @batch_start_time = GETDATE(); 
		PRINT '=========================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=========================================================';

		PRINT '---------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '---------------------------------------------------------';
		-- Full load to crm_cust_info Table. created by Mohammed Saeed
		SET @Start_time = GETDATE(); 
		PRINT '>> TRUNCATING TABLE: crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> INSERTING DATA INTO: crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\COMPU ZONE\Desktop\DW Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST( DATEDIFF(second, @Start_time , @End_time) AS NVARCHAR) + ' Seconds';


		-- Full load to crm_prd_info Table. created by Mohammed Saeed
		SET @Start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> INSERTING DATA INTO: crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\COMPU ZONE\Desktop\DW Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		-- Full load to crm_sales_details Table. created by Mohammed Saeed
		SET @Start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>> INSERTING DATA INTO: crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\COMPU ZONE\Desktop\DW Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST( DATEDIFF(second, @Start_time , @End_time) AS NVARCHAR) + ' Seconds';

		PRINT '---------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '---------------------------------------------------------';
		-- Full load to erp_cust_az12 Table. created by Mohammed Saeed
		SET @Start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>> INSERTING DATA INTO: erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\COMPU ZONE\Desktop\DW Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST( DATEDIFF(second, @Start_time , @End_time) AS NVARCHAR) + ' Seconds';


		-- Full load to erp_loc_a101 Table. created by Mohammed Saeed
		SET @Start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>> INSERTING DATA INTO: erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\COMPU ZONE\Desktop\DW Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST( DATEDIFF(second, @Start_time , @End_time) AS NVARCHAR) + ' Seconds';


		-- Full load to erp_px_cat_g1v2 Table. created by Mohammed Saeed
		SET @Start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>> INSERTING DATA INTO: erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\COMPU ZONE\Desktop\DW Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @End_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST( DATEDIFF(second, @Start_time , @End_time) AS NVARCHAR) + ' Seconds';
		PRINT '......................................';

		SET @batch_end_time = GETDATE(); 
		PRINT '===================================================================';
		PRINT 'Loading Bronze Layer Is Completed!';
		PRINT 'Total Load Duration: ' + CAST( DATEDIFF(second, @batch_start_time , @batch_end_time) AS NVARCHAR) + ' Seconds';
		PRINT '===================================================================';
	END TRY

	BEGIN CATCH 
		PRINT '====================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message'+ ERROR_MESSAGE();
		PRINT 'Error Message'+ CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message'+ CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '====================================================';
	END CATCH 
END
