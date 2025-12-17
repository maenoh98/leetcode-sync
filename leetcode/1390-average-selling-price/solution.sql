# Write your MySQL query statement below
SELECT 
    -- *
    product_id
    , ROUND(total_revenue / total_units, 2) AS average_price
FROM (
    SELECT
        p.product_id
        , IFNULL(SUM(p.price * s.units), 0) AS total_revenue
        , IFNULL(SUM(s.units), 1) AS total_units
    FROM prices p
    LEFT JOIN unitssold s
        ON p.product_id = s.product_id
        AND s.purchase_date BETWEEN start_date AND end_date
    GROUP BY p.product_id
) sub
;
