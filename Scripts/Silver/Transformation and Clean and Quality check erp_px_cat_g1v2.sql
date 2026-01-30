PRINT '>> Truncating Table: erp_px_cat_g1v2 ' ; 
TRUNCATE TABLE silver.erp_px_cat_g1v2;
INSERT INTO silver.erp_px_cat_g1v2 (id,
cat, 
subcat,
maintenance)
SELECT 
id,
cat, 
subcat,
maintenance
FROM bronze.erp_px_cat_g1v2


-- Check for unwanted spaces
SELECT * from bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat)

SELECT * from bronze.erp_px_cat_g1v2
WHERE subcat != TRIM(subcat)

SELECT * from bronze.erp_px_cat_g1v2
WHERE maintenance != TRIM(maintenance)

-- Data Standardization & Consistency 
SELECT DISTINCT 
FROM bronze.erp_px_cat_g1v2