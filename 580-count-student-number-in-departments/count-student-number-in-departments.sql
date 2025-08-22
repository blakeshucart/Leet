/* Write your T-SQL query statement below */
WITH counts AS (
    SELECT DISTINCT d.dept_name, 
        COUNT(s.student_id) OVER (PARTITION BY d.dept_name) AS student_number
    FROM Department AS d
    JOIN Student AS s ON s.dept_id = d.dept_id
)

SELECT d.dept_name,
    (
        CASE 
            WHEN c.student_number > 0 THEN c.student_number
            ELSE 0
        END
    ) AS student_number
FROM Department AS d
LEFT JOIN counts AS c ON d.dept_name = c.dept_name
ORDER BY c.student_number DESC, d.dept_name ASC