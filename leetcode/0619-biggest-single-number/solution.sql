# Write your MySQL query statement below

SELECT
    IFNULL(MAX(num), NULL) AS num
FROM
    (
    SELECT
        num
        , COUNT(num) AS cnt
    FROM mynumbers
    GROUP BY num
    HAVING cnt <= 1
    ) single
;
