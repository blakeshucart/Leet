/* Write your T-SQL query statement below */
SELECT e.[name] AS Employee
FROM Employee as e
JOIN Employee as m ON e.managerId = m.id
WHERE e.salary > m.salary