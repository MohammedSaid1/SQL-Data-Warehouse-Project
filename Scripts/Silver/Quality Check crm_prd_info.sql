-- Check for Nulls Duplicates in primary key 
-- Expectaation: No Results
SELECT prd_id, COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL 

-- check for unwanted spaces 
-- Expectation: No Results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm) 

-- check for Null Values or Nagative numbers
-- Expectation: No Results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL	

-- Data Standardization & consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check for Invalid date orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

SELECT * 
FROM silver.crm_prd_info