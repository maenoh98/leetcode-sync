# Write your MySQL query statement below

# each month and country
# the number of transactions & their total amount
# the number of approved transactions & their total amount

SELECT
    sub_t.month
    , sub_t.country
    , trans_count
    , IFNULL(approved_count, 0) AS approved_count
    , trans_total_amount
    , IFNULL(approved_total_amount, 0) AS approved_total_amount
FROM (
    SELECT
        DATE_FORMAT(trans_date, '%Y-%m') AS month
        , IFNULL(COUNT(id), 0) AS trans_count
        , IFNULL(SUM(amount), 0) AS trans_total_amount
        , country
    FROM transactions
    GROUP BY
        month
        , country
    ) AS sub_t
LEFT JOIN (
    SELECT 
        DATE_FORMAT(trans_date, '%Y-%m') AS month
        , IFNULL(COUNT(id), 0) AS approved_count
        , IFNULL(SUM(amount), 0) AS approved_total_amount
        , country
    FROM transactions
    WHERE state = 'approved'
    GROUP BY 
        month
        , country
) s
    ON sub_t.month = s.month
        AND sub_t.country <=> s.country
;
