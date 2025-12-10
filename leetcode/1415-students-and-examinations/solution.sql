# Write your MySQL query statement below
SELECT sub.student_id
    , sub.student_name
    , sub.subject_name
    , COUNT(e.student_id) AS attended_exams
FROM (
    SELECT *
    FROM students
    CROSS JOIN subjects
    ) sub
LEFT JOIN examinations e
    ON sub.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY
    sub.student_id
    , sub.subject_name
ORDER BY 
    sub.student_id
    , sub.subject_name
;
