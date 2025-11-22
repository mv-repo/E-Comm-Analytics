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

    -- total number of orders this product appears in
    COUNT(DISTINCT od.order_id) AS total_orders,

    -- total units sold
    SUM(id.quantity) AS total_units_sold,

    -- total revenue
    SUM(id.quantity * id.price) AS total_revenue,

    -- ASP: total revenue / total units
    SAFE_DIVIDE(SUM(id.quantity * id.price), SUM(id.quantity)) AS avg_selling_price,

    -- number of unique customers who bought the product
    COUNT(DISTINCT od.customer_id) AS customers_who_bought,

    -- time range of sales
    MIN(od.order_date) AS first_sale_date,
    MAX(od.order_date) AS last_sale_date

FROM item_data id
JOIN order_data od
    ON id.order_id = od.order_id
JOIN `ecommerce-analytics-12345.raw_data.products_raw` p
    ON id.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_revenue DESC;
