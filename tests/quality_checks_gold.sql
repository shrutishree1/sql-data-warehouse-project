/*
===================================================================================================
Quality Checks
===================================================================================================
Script Purpose:
       This script performs quality checks to validate the integrity, consistency and accuracy
       of the Gold Layer.
       This checks ensures:
        -  Uniqueness of the surrogate keys in the dimensions tables.
        -  Referential integrity between fact and dimension table.
        -  Validation of relationships in the data model for analytical purposes. 

Usage Notes:
    - Run these checks after data loading silver layer.
    - Investigate and resolve any discrepancies found during the checks.
====================================================================================================
*/

-- =======================================================================================
-- Checking 'gold.dim_customers'
-- =======================================================================================
-- Check for uniquesness of cusotmer key in gold.dim_customers
-- Expectations: No results
SELECT 
     customer_key,
     count(*)
FROM gold.dim_customers
GROUP BY customer_key
HAVING count(*) > 1;


-- =======================================================================================
-- Checking 'gold.product_key'
-- =======================================================================================
-- Check for uniquesness of product key in gold.dim_products
-- Expectations: No results
SELECT 
     product_key,
     count(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING count(*) > 1;

-- =======================================================================================
-- Checking 'gold.fact_sales'
-- =======================================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL;
