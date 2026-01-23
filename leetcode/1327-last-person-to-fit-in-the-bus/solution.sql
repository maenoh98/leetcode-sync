# Write your MySQL query statement below
WITH sub_query AS (
    SELECT
        person_name
        , turn
        , SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM queue
)
SELECT person_name
FROM sub_query
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1
;
