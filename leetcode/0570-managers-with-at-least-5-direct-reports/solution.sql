# Write your MySQL query statement below
SELECT e.name
FROM (
    SELECT managerId
        , COUNT(id) AS count
    FROM employee
    WHERE managerID IS NOT NULL
    GROUP BY managerId
    HAVING count >= 5
) sub
JOIN employee e
    ON sub.managerId = e.id
;
