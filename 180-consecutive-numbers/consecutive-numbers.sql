WITH nums AS ( 
    SELECT DISTINCT num , LAG(num) OVER (ORDER BY id) AS prv, LEAD(num) OVER (ORDER BY id) AS nxt
    FROM logs 
)

SELECT DISTINCT num AS ConsecutiveNums 
FROM nums
WHERE num = prv AND num = nxt