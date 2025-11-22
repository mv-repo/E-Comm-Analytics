CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.products_raw` AS
SELECT * FROM UNNEST([
  STRUCT(
    GENERATE_UUID() AS product_id,
    'Smartphone' AS product_name,
    'Electronics' AS category,
    699.00 AS price
  ),
  STRUCT(
    GENERATE_UUID() AS product_id,
    'Running Shoes' AS product_name,
    'Sportswear' AS category,
    120.00 AS price
  ),
  STRUCT(
    GENERATE_UUID() AS product_id,
    'Coffee Maker' AS product_name,
    'Home Appliances' AS category,
    89.00 AS price
  ),
  STRUCT(
    GENERATE_UUID() AS product_id,
    'Wireless Headphones' AS product_name,
    'Electronics' AS category,
    149.99 AS price
  ),
  STRUCT(
    GENERATE_UUID() AS product_id,
    'Backpack' AS product_name,
    'Accessories' AS category,
    59.00 AS price
  )
]);
