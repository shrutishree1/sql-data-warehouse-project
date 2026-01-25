/*
===================================================================================================
Quality Checks
===================================================================================================
Script Purpose:
       This script performs various quality checks for data consistency, accuracy
       and standardization across 'silver' schemas.
       It include checks for:
        -  Null or duplicate primary keys.
        -  Unwanted spaces in string fields.
        -  Data standardization and consistency.
        -  Invalid date ranges and orders.
        -  Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading silver layer.
    - Investigate and resolve any discrepancies found during the checks.
====================================================================================================
*/


====================== -- DATA QUALITY CHECK FOR CRM TABLES -- =============================
====================== -- --------------------------------- -- =============================

--------------------------------------------------------------------------------------------
crm_cust_info
--------------------------------------------------------------------------------------------
  
-- Check1: checking NULLs and DUPLICATE in Primary Key.
SELECT 
cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*)>1 OR cst_id IS NULL;

-- Check2: Checking Unwanted Spaces
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT cst_gndr
FROM silver.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)

SELECT cst_marital_status
FROM silver.crm_cust_info
WHERE cst_marital_status != TRIM(cst_marital_status)

SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

-----------------------------------------------------------------------------------------
crm_prd_info
-----------------------------------------------------------------------------------------
  
-- CHECK1: Duplicates in primary key prd_id.
SELECT 
prd_id,
COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*)>1 OR prd_id IS NULL;

-- CHECK2: checking unwanted spaces in prd_nm columns.
SELECT 
prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- CHECK3: Checking negative or null numbers in prd_cost
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- CHECK4: Giving full name to the abbreviated words. ( Data Standardization & Consistency )
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;

-- CHECKS 5: Invalid Date Orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-----------------------------------------------------------------------------------------
crm_sales_details
-----------------------------------------------------------------------------------------

-- Checking the Invalid Date
SELECT * FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
or sls_order_dt > sls_due_dt ;

-- Checking Business Rule
/* Sales = Quantity * Price */
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales,sls_quantity,sls_price


====================== -- DATA QUALITY CHECK FOR ERP TABLES -- =============================
====================== -- --------------------------------- -- =============================

--------------------------------------------------------------------------------------------
erp_cust_az12
--------------------------------------------------------------------------------------------
  
-- checking joining columns data ex: CID
SELECT 
CID
FROM
silver.erp_cust_az12

-- Identifying out of range dates
SELECT DISTINCT BDATE
FROM silver.erp_cust_az12
WHERE BDATE < '1924-01-01' OR BDATE > GETDATE()

-- DATA STANDARDIZATION & CONSISTENCY FOR GEN COLUMN
SELECT DISTINCT GEN
FROM silver.erp_cust_az12

SELECT * FROM silver.erp_cust_az12;

--------------------------------------------------------------------------------------------
erp_loc_a101
--------------------------------------------------------------------------------------------
  
SELECT 
CID,
CNTRY
FROM bronze.erp_loc_a101;

SELECT CST_KEY FROM silver.crm_cust_info; -- WE WILL JOIN WITH THIS TABLE

-- DATA STANDARDIZATION & CONSISTENCY FOR CNTRY COLUMN
SELECT DISTINCT CNTRY
FROM bronze.erp_loc_a101

-- DATA STANDARDIZATION & CONSISTENCY FOR CNTRY COLUMN
SELECT DISTINCT CNTRY
FROM silver.erp_loc_a101

--------------------------------------------------------------------------------------------
erp_px_cat_g1v2
--------------------------------------------------------------------------------------------
 
-- CHECKING FOR UNWANTED SPACES FOR COLUMNS
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE CAT != TRIM(CAT) OR SUBCAT != TRIM(SUBCAT) OR MAINTENANCE != TRIM(MAINTENANCE)

-- DATA STANDARDIZATION & CONSISTENCY FOR COLUMNS
SELECT DISTINCT CAT
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT SUBCAT
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT MAINTENANCE
FROM bronze.erp_px_cat_g1v2
