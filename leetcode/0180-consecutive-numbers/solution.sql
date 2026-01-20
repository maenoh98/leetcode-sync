# Write your MySQL query statement below
SELECT
    DISTINCT(num) AS ConsecutiveNums
FROM (
    SELECT
        num
        , IFNULL(LAG(num) OVER(ORDER BY id), 0) AS num_prev
        , IFNULL(LEAD(num) OVER(ORDER BY id), 0) AS num_next
    FROM logs
) sub
WHERE num = num_prev AND num = num_next
;
