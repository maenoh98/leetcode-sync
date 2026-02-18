# Write your MySQL query statement below
WITH salary_rank AS (
    SELECT
    name, 
    departmentId,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY departmentId
        ORDER BY salary DESC
    ) AS sal_rank
FROM employee
)
SELECT
    d.name AS Department,
    sr.name AS Employee,
    sr.salary AS Salary
FROM salary_rank sr
LEFT JOIN department d
ON sr.departmentId = d.id
WHERE sal_rank <= 3
;
