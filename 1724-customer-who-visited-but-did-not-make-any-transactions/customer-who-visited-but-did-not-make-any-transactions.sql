/* Write your T-SQL query statement below */
WITH notrans AS (
    SELECT v.*
    FROM Visits as v
    FULL OUTER JOIN Transactions as t ON v.visit_id = t.visit_id
    WHERE t.transaction_id IS NULL
)

SELECT nt.customer_id, COUNT(nt.customer_id) AS count_no_trans 
FROM notrans as nt
GROUP BY nt.customer_id