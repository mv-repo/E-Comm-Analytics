CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.order_items_raw` AS
WITH orders AS (
  SELECT order_id FROM `ecommerce-analytics-12345.raw_data.orders_raw`
),
products AS (
  SELECT product_id, price FROM `ecommerce-analytics-12345.raw_data.products_raw`
)
SELECT
    GENERATE_UUID() AS order_item_id,
    o.order_id,
    p.product_id,
    CAST(1 + FLOOR(RAND() * 3) AS INT64) AS quantity,
    p.price AS price
FROM orders o
JOIN products p
ON RAND() < 0.25   -- roughly 1–2 items per order
LIMIT 60000;
