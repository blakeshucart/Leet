/* Write your T-SQL query statement below */
SELECT e.[name], b.[bonus]
FROM Employee AS e
FULL OUTER JOIN Bonus AS b ON e.empId = b.empId
WHERE b.bonus < 1000 or b.bonus IS NULL