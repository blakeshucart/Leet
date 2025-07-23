SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT *, LEAD(num, 1) OVER (ORDER BY id) as next1, LEAD(num, 2) OVER (ORDER BY id) as next2
    FROM Logs
) AS t
WHERE num = t.next1 AND num = t.next2