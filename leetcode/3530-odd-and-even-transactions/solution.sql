# Write your MySQL query statement below
WITH category AS (
    SELECT  
        transaction_date,
        amount,
        CASE
            WHEN amount%2 = 1 THEN 'odd'
            ELSE 'even'
        END AS category
    FROM transactions
),
odd_sum AS (
    SELECT
        transaction_date,
        SUM(amount) AS odd_sum
    FROM category
    WHERE category = 'odd'
    GROUP BY transaction_date
),
even_sum AS (
    SELECT
        transaction_date,
        SUM(amount) AS even_sum
    FROM category
    WHERE category = 'even'
    GROUP BY transaction_date
)
SELECT 
    day.transaction_date,
    COALESCE(os.odd_sum, 0) AS odd_sum,
    COALESCE(es.even_sum, 0) AS even_sum
FROM (
    SELECT
        transaction_date
    FROM transactions
    GROUP BY transaction_date
) day
LEFT JOIN odd_sum os
    ON day.transaction_date = os.transaction_date
LEFT JOIN even_sum es
    ON day.transaction_date = es.transaction_date
ORDER BY transaction_date ASC
;
