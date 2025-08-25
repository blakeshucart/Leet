/* Write your T-SQL query statement below */
WITH weight_sums AS (
    SELECT q.person_name, SUM(q.weight) OVER (ORDER BY q.turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_weight, q.turn
    FROM [Queue] AS q 
)

SELECT TOP (1) person_name
FROM weight_sums AS ws
WHERE ws.cum_weight <= 1000
ORDER BY ws.turn DESC

