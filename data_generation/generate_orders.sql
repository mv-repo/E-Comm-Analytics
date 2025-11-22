CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.orders_raw` AS
WITH cust AS (
  SELECT customer_id FROM `ecommerce-analytics-12345.raw_data.customers_raw`
)
SELECT
    GENERATE_UUID() AS order_id,
    customer_id,
    DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND() * 365) AS INT64) DAY) AS order_date,
    ROUND(20 + RAND() * 400, 2) AS total_amount
FROM cust, UNNEST(GENERATE_ARRAY(1, 4)) AS x   -- ~4 orders per customer = 20k orders
LIMIT 20000;
