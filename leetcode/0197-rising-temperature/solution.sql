# Write your MySQL query statement below
SELECT A.id
FROM weather A
LEFT JOIN weather B ON B.recordDate = DATE_SUB(A.recordDate, INTERVAL 1 DAY)
WHERE A.temperature > B.temperature
;
