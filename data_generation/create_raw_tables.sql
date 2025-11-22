CREATE SCHEMA IF NOT EXISTS `ecommerce-analytics-12345.raw_data`;

CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.customers_raw` (
  customer_id STRING,
  first_name STRING,
  last_name STRING,
  email STRING,
  signup_date DATE
);

CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.products_raw` (
  product_id STRING,
  product_name STRING,
  category STRING,
  base_price FLOAT64
);

CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.orders_raw` (
  order_id STRING,
  customer_id STRING,
  order_date DATE,
  status STRING
);

CREATE OR REPLACE TABLE `ecommerce-analytics-12345.raw_data.order_items_raw` (
  order_id STRING,
  product_id STRING,
  quantity INT64,
  price FLOAT64
);
