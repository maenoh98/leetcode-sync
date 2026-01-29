# Write your MySQL query statement below
WITH categorized AS (
    SELECT
        id,
        student,
        CASE
            WHEN (LEAD(id) OVER (ORDER BY id) IS NULL)
                AND id % 2 = 1
                THEN 'keep'
            ELSE 'change'
        END AS category,
        CASE
            WHEN id % 2 = 0 THEN 'even'
            ELSE 'odd'
        END AS id_category
    FROM seat
),
changed AS (
        SELECT
        CASE 
            WHEN category = 'change' AND id_category = 'odd' THEN id+1
            WHEN category = 'change' AND id_category = 'even' THEN id-1
            ELSE id
        END AS new_id,
        student
        FROM categorized
)
SELECT
    new_id AS id,
    student
FROM changed
ORDER BY id
;
