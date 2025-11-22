-- create_customer_cohorts.sql
CREATE OR REPLACE TABLE `ecommerce-analytics-12345.analytics.customer_cohorts` AS
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS cohort_date
    FROM `ecommerce-analytics-12345.raw_data.orders_raw`
    GROUP BY customer_id
),
order_data AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        fp.cohort_date,
        DATE_DIFF(o.order_date, fp.cohort_date, WEEK) AS weeks_since_join
    FROM `ecommerce-analytics-12345.raw_data.orders_raw` o
    JOIN first_purchase fp USING(customer_id)
)
SELECT
    customer_id,
    cohort_date,
    order_id,
    order_date,
    weeks_since_join
FROM order_data;
