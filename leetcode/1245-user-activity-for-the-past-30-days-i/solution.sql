# Write your MySQL query statement below

SELECT
    activity_date AS day
    , COUNT(DISTINCT user_id) AS active_users
FROM (
    SELECT 
        user_id
        , activity_date
        , COUNT(session_id) AS cnt
    FROM activity
    WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
    GROUP BY user_id, activity_date
    HAVING cnt > 0
    ) sub
GROUP BY activity_date
;
