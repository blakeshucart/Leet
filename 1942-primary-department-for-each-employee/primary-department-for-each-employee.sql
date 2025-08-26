/* Write your T-SQL query statement below */
WITH dept_Count AS (
    SELECT e.employee_id, COUNT(e.department_id) OVER (PARTITION BY e.employee_id) AS department_count
    FROM Employee AS e
),
depts AS (
    SELECT e.employee_id,
        (
            CASE 
                WHEN EXISTS (SELECT 1 FROM dept_Count AS d WHERE d.department_count = 1 AND e.employee_id = d.employee_id) THEN e.department_id
                WHEN e.primary_flag = 'Y' THEN e.department_id
                ELSE null
            END
        ) AS department_id
    FROM Employee AS e
)

SELECT *
FROM depts as de
WHERE de.department_id IS NOT null