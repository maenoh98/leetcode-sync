# Write your MySQL query statement below

#  percentage of immediate orders
# in the first orders of all customers

SELECT
    ROUND(
        (
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0 END) / COUNT(*) * 100
        )
    , 2) AS immediate_percentage
FROM delivery d
JOIN (
    SELECT
        customer_id
        , MIN(order_date) AS first_order
    FROM delivery
    GROUP BY customer_id
) sub
    ON d.customer_id = sub.customer_id
    AND d.order_date = sub.first_order
;
