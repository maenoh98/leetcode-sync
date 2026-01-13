# Write your MySQL query statement below

SELECT
    e.employee_id
    , e.name
    , sub.reports_count
    , sub.average_age
FROM employees e
JOIN (
    SELECT 
        reports_to AS manager_id
        , COUNT(DISTINCT(employee_id)) AS reports_count
        , ROUND(AVG(age), 0) AS average_age
    FROM employees
    GROUP BY reports_to
) sub
    ON e.employee_id = manager_id
ORDER BY e.employee_id
;
