# Write your MySQL query statement below

SELECT
    s.product_id
    , sub.first_year
    , s.quantity
    , s.price
FROM sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM sales
    GROUP BY product_id
) sub
    ON s.product_id = sub.product_id
    AND s.year = sub.first_year
;
