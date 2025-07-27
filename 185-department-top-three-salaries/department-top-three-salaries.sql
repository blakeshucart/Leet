/* Write your T-SQL query statement below */
WITH top_earners AS (
    SELECT *, 
    DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS Rank
    FROM Employee AS e
)
SELECT d.name AS Department, te.name AS Employee, te.salary AS Salary
FROM top_earners as te
JOIN Department AS d ON d.id = te.departmentId
WHERE te.Rank <=3

