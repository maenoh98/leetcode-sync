# Write your MySQL query statement below
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM employee e
LEFT JOIN department d
ON e.departmentId = d.id
WHERE (departmentID, salary) IN (
    SELECT
        departmentId,
        MAX(salary) OVER (
            PARTITION BY departmentId
        ) AS max_salary
    FROM employee
)
;
