# Write your MySQL query statement below
WITH daily_total AS (
    SELECT
        SUM(amount) AS daily_total_amount,
        visited_on
    FROM customer
    GROUP BY visited_on
),
7_days_count AS (
    SELECT 
        visited_on,
        daily_total_amount,
        COUNT(*) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS window_check
    FROM daily_total
),
window_cal AS (
    SELECT
        visited_on,
        window_check,
        SUM(daily_total_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(
            AVG(daily_total_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount
    FROM 7_days_count
    ORDER BY visited_on
)
SELECT visited_on, amount, average_amount
FROM window_cal
WHERE window_check >= 7
;
