# Write your MySQL query statement below
SELECT name, bonus
FROM employee e
LEFT JOIN bonus b
    ON e.empid = b.empid
WHERE bonus < 1000
    OR bonus IS NULL
;
