/* Write your T-SQL query statement below */
WITH valid_trips AS (
    SELECT t.*
    FROM Trips AS t
    JOIN Users AS u ON u.users_id = t.client_id
    JOIN Users AS d ON d.users_id = t.driver_id
    WHERE d.banned = 'No' AND d.role = 'driver'
    AND u.banned = 'No' AND u.role = 'client'
),
counts AS (
    SELECT request_at as [Day],
        COUNT(id) AS trips,
        COUNT(CASE WHEN [status] <> 'completed' THEN 1 ELSE null END) AS cancelled
    FROM valid_trips
    WHERE request_at >= '2013-10-01' AND request_at <= '2013-10-03'
    GROUP BY request_at
    
)

SELECT [Day], ROUND(1.0 * cancelled / trips, 2) AS [Cancellation Rate]
FROM counts
ORDER BY [Day]
