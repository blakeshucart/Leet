WITH reordered AS (SELECT CASE
        WHEN s.id % 2 = 1 THEN s.id + 1
        WHEN s.id % 2 = 0 THEN s.id - 1
        ELSE s.id
    END AS id,
    s.student
FROM Seat AS s) 

SELECT ROW_NUMBER() OVER(ORDER BY r.id ASC) AS id,
r.student
FROM reordered AS r