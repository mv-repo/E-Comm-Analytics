INSERT INTO `ecommerce-analytics-12345.raw_data.order_items_raw`
WITH items AS (
SELECT o.order_id,p.product_id,CEIL(RAND()*3),
p.base_price + RAND()*20
FROM `ecommerce-analytics-12345.raw_data.orders_raw` o
JOIN `ecommerce-analytics-12345.raw_data.products_raw` p ON TRUE
WHERE RAND()<0.25)
SELECT * FROM items;
