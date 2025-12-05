# Write your MySQL query statement below
SELECT customer_id, COUNT(*) AS count_no_trans
FROM (
    SELECT v.visit_id, v.customer_id
    FROM visits v
    LEFT OUTER JOIN transactions t ON v.visit_id = t.visit_id
    WHERE  t.transaction_id IS NULL
) AS subQuery
GROUP BY customer_id
;
