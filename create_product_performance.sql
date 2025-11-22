-- create_product_performance.sql
CREATE OR REPLACE TABLE `ecommerce-analytics-12345.analytics.product_performance` AS
WITH item_data AS (
    SELECT
        oi.product_id,
        oi.quantity,
        oi.price,
        oi.order_id
    FROM `ecommerce-analytics-12345.raw_data.order_items_raw` oi
),
order_data AS (
    SELECT
        o.order_id,
        o.order_date,
        o.customer_id
    FROM `ecommerce-analytics-12345.raw_data.orders_raw` o
)
SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(DISTINCT od.order_id) AS total_orders,
    SUM(item_data.quantity) AS total_units_sold,
    SUM(item_data.quantity * item_data.price) AS total_revenue,
    SAFE_DIVIDE(SUM(item_data.quantity * item_data.price), SUM(item_data.quantity)) AS avg_selling_price,
    COUNT(DISTINCT od.customer_id) AS customers_who_bought,
    MIN(od.order_date) AS first_sale_date,
    MAX(od.order_date) AS last_sale_date
FROM item_data
JOIN order_data od USING(order_id)
JOIN `ecommerce-analytics-12345.raw_data.products_raw` p USING(product_id)
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC;
