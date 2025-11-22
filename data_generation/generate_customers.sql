INSERT INTO `ecommerce-analytics-12345.raw_data.customers_raw`
SELECT CONCAT("C", GENERATE_UUID()), INITCAP(SPLIT(name," ")[OFFSET(0)]),
INITCAP(SPLIT(name," ")[OFFSET(1)]), CONCAT(REPLACE(LOWER(name)," ","."),"@example.com"),
DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND()*365) AS INT64) DAY)
FROM UNNEST(GENERATE_ARRAY(1,1000)),UNNEST(["john doe","emma stone","li wei",
"fatima ali","alex hunter","sara kim","michael smith"]);
