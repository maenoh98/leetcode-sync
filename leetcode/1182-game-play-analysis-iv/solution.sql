# Write your MySQL query statement below

SELECT 
    ROUND(
        COUNT(b.player_id) / COUNT(DISTINCT(a.player_id))
    , 2) AS fraction
FROM activity a
LEFT JOIN (
    SELECT 
        player_id
        , MIN(event_date) AS first_date
    FROM activity
    GROUP BY player_id
    ) b
    ON a.player_id = b.player_id
        AND DATE_SUB(a.event_date, INTERVAL 1 DAY) = b.first_date
;
