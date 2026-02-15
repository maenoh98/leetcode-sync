# Write your MySQL query statement below
WITH find_user AS (
    SELECT
        u.name AS results
    FROM (
        SELECT
            COUNT(DISTINCT movie_id) AS cnt_movie,
            user_id
        FROM MovieRating
        GROUP BY user_id
    ) s
    LEFT JOIN users u
        ON s.user_id = u.user_id
    ORDER BY s.cnt_movie DESC,
        u.name ASC
    LIMIT 1
),
find_movie AS (
    SELECT 
        m.title AS results
    FROM (
        SELECT
            AVG(rating) AS avg_rating,
            movie_id
        FROM MovieRating
        WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY movie_id
    ) c
    LEFT JOIN Movies m
        ON c.movie_id = m.movie_id
    ORDER BY c.avg_rating DESC,
        m.title ASC
    LIMIT 1
)
SELECT results FROM find_user
UNION ALL
SELECT results FROM find_movie
;
