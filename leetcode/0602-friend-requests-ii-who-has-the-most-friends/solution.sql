# Write your MySQL query statement below
SELECT
    left_id AS id,
    COUNT(DISTINCT(right_id)) AS num
FROM (
    SELECT
        requester_id AS left_id,
        accepter_id AS right_id
    FROM requestAccepted

    UNION

    SELECT
        accepter_id AS left_id,
        requester_id AS right_id
    FROM requestAccepted
) sub
GROUP BY left_id
ORDER BY num DESC
LIMIT 1
;
