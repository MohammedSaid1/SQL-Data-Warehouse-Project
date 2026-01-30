-- Check for Nulls Duplicates in primary key 
-- Expectaation: No Results

SELECT cst_id, COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL 


-- check for unwanted spaces
-- Expection: No Results
SELECT cst_firstname 
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Check Data Standardization & Consistency 
SELECT DISTINCT cst_gndr 
FROM silver.crm_cust_info

-- check all data
SELECT * FROM silver.crm_cust_info