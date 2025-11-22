-- create_daily_metrics.sql
CREATE OR REPLACE TABLE `ecommerce-analytics-12345.analytics.daily_metrics` AS
WITH orders AS (
    SELECT
        order_id,
        order_date,
        customer_id
    FROM `ecommerce-analytics-12345.raw_data.orders_raw`
),
items AS (
    SELECT
        order_id,
        quantity,
        price
    FROM `ecommerce-analytics-12345.raw_data.order_items_raw`
),
daily AS (
    SELECT
        o.order_date,
        COUNT(DISTINCT o.customer_id) AS active_customers,
        SUM(i.quantity * i.price) AS daily_revenue,
        SAFE_DIVIDE(SUM(i.quantity * i.price), COUNT(DISTINCT o.order_id)) AS aov
    FROM orders o
    JOIN items i USING(order_id)
    GROUP BY o.order_date
)
SELECT
    *,
    AVG(daily_revenue) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7_day_revenue,
    LAG(daily_revenue, 7) OVER (ORDER BY order_date) AS prev_week_revenue,
    SAFE_DIVIDE(
        daily_revenue - LAG(daily_revenue, 7) OVER (ORDER BY order_date),
        LAG(daily_revenue, 7) OVER (ORDER BY order_date)
    ) AS week_over_week_growth
FROM daily
ORDER BY order_date;
