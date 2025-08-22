/* Write your T-SQL query statement below */
WITH dept_sal_max AS (
    SELECT d.id AS deptId, d.name AS Department, MAX(e.salary) OVER (PARTITION BY d.id) AS max_salary
    FROM Department AS d
    JOIN Employee AS e ON e.departmentId = d.id
)

SELECT DISTINCT ds.Department, e.name AS Employee, ds.max_salary AS Salary
FROM Employee AS e
JOIN dept_sal_max AS ds ON ds.max_salary = e.salary AND ds.deptId = e.departmentId