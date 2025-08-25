WITH launch_year AS (
    SELECT s.product_id, MIN(s.year) AS first_year
    FROM Sales AS s
    GROUP BY s.product_id
)


SELECT ly.product_id, ly.first_year, s.quantity, s.price
FROM Sales AS s
JOIN launch_year AS ly ON ly.product_id = s.product_id
WHERE ly.first_year = s.year

