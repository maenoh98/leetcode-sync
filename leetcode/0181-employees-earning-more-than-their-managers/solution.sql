# Write your MySQL query statement below
SELECT
    name AS Employee
FROM employee e
LEFT JOIN (
    SELECT
        id,
        salary AS manager_salary
    FROM employee
) m
    ON e.managerId = m.id
WHERE salary > manager_salary
;
