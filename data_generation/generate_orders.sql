INSERT INTO `ecommerce-analytics-12345.raw_data.orders_raw`
WITH cust AS (SELECT customer_id FROM `ecommerce-analytics-12345.raw_data.customers_raw`)
SELECT CONCAT("O",GENERATE_UUID()), (SELECT customer_id FROM cust ORDER BY RAND() LIMIT 1),
DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND()*180) AS INT64) DAY),
IF(RAND()>0.05,"Completed","Cancelled")
FROM UNNEST(GENERATE_ARRAY(1,10000));
