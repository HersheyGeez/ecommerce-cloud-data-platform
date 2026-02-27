--using correct database context
USE DATABASE ECOMMERCE_DWH;

--checking for duplicates inside STAGING.ORDERS_STG.order_id
SELECT 
    order_id,
    COUNT(*) AS duplicate_cnt
FROM STAGING.ORDERS_STG
GROUP BY order_id
HAVING COUNT(*) > 1;

--checking for nulls inside STAGING.ORDERS_STG.order_id
SELECT
    COUNT(*)
FROM STAGING.ORDERS_STG
WHERE order_id IS NULL;
