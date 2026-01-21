WITH latest AS (
    SELECT 
        product_id
        , new_price
        , ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM products
    WHERE change_date <= '2019-08-16'
)
SELECT
    p.product_id
    , COALESCE(l.new_price, 10) AS price
FROM (
    SELECT DISTINCT(product_id) AS product_id
    FROM products
) p
LEFT JOIN latest l ON p.product_id = l.product_id
    AND l.rn = 1
;
