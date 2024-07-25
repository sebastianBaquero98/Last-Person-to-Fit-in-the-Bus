SELECT
    person_name
FROM
    (
        SELECT
            person_id,
            person_name,
            turn,
            sum(weight) OVER (ORDER BY turn) as cumulative_weight
        FROM
            Queue
    ) as a
GROUP BY
    person_name
HAVING
    MAX(a.cumulative_weight)  <= 1000
ORDER BY
    turn DESC
LIMIT 1
