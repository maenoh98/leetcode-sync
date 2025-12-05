# Write your MySQL query statement below
SELECT u.unique_id, e.name
FROM employees e
LEFT OUTER JOIN employeeuni u ON e.id = u.id
;
