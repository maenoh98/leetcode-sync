# Write your MySQL query statement below

SELECT class
FROM
    (
    SELECT 
        class
        , COUNT(DISTINCT student) AS cnt
    FROM courses
    GROUP BY class
    ) sub
WHERE cnt >= 5
;
