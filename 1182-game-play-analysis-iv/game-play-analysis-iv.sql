-- Write your PostgreSQL query statement below
with cte as(
    select
    player_id,
    row_number() over (partition by player_id order by event_date) as rank,
    event_date,
    LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) as next_event
    from Activity
)
SELECT
    ROUND(
        1.0 * 
        COUNT(DISTINCT 
            CASE
                WHEN next_event = event_date + INTERVAL '1 day'
                THEN player_id
            END) /
        COUNT(DISTINCT player_id),
    2) AS fraction
FROM cte
where rank=1;