WITH Starts AS (
  SELECT * 
  FROM Activity
  WHERE activity_type = 'start'
),
Ends AS (
  SELECT * 
  FROM Activity
  WHERE activity_type = 'end'
)

SELECT
  s.machine_id,
  CAST(AVG(e.timestamp - s.timestamp) AS DECIMAL(10,3)) AS processing_time
FROM
  Starts s
JOIN
  Ends e
  ON s.machine_id = e.machine_id
     AND s.process_id = e.process_id
GROUP BY
  s.machine_id;