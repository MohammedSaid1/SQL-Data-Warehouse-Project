 -- Trancate and load the erp_loc_a101 table
TRUNCATE TABLE silver.erp_loc_a101;
INSERT INTO silver.erp_loc_a101 (cid, cntry)
SELECT 
REPLACE(cid , '-', '')cid, 
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
     WHEN TRIM(cntry) IN ('US' , 'USA') THEN 'United States'
     WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'N/A'
     ELSE TRIM(cntry)
END cntry
FROM bronze.erp_loc_a101


-- DATA Standardization & Consistency 
SELECT DISTINCT cntry
FROM bronze.erp_loc_a101 