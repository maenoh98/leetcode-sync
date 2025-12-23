# Write your MySQL query statement below
SELECT
    query_name
    , ROUND(AVG(rating / position), 2) AS quality
    , ROUND(AVG(rating < 3), 4) * 100 AS poor_query_percentage
FROM queries
GROUP BY query_name
;
