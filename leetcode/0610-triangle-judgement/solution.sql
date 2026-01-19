# Write your MySQL query statement below
SELECT
    *
    , CASE
        WHEN x > ABS(y-z) AND x < (y+z) THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM triangle
;

