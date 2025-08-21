/* Write your T-SQL query statement below */
WITH events AS (
    SELECT player_id, 
        event_date AS install_dt,
        LEAD(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS next_date,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
), 
events_retained AS (
    SELECT player_id, 
        install_dt,
        (
            CASE
                WHEN next_date IS NOT NULL AND DATEDIFF(day, install_dt, next_date) = 1 THEN 1
                ELSE 0
            END
        ) AS retained
    FROM events
    WHERE rn = 1
),
res AS (
    SELECT install_dt, 
        COUNT(player_id) as installs, 
        COUNT(CASE WHEN retained = 1 THEN 1 ELSE null END) AS r_count
    FROM events_retained
    GROUP BY install_dt
)

SELECT install_dt, installs, ROUND(CAST(r_count AS decimal(10,2)) / installs, 2) AS Day1_retention
FROM res
ORDER BY install_dt ASC 


