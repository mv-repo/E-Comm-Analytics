CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.customers_raw` AS
WITH countries AS (
    SELECT ['USA','Canada','UK','Germany','France','Australia','India','Brazil','Japan','UAE'] AS c
)
SELECT
    GENERATE_UUID() AS customer_id,
    CONCAT('Customer ', CAST(ROW_NUMBER() OVER() AS STRING)) AS customer_name,
    c[OFFSET(CAST(FLOOR(RAND() * ARRAY_LENGTH(c)) AS INT64))] AS country,
    DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND()*900) AS INT64) DAY) AS signup_date
FROM countries, UNNEST(GENERATE_ARRAY(1, 5000)) AS x;
