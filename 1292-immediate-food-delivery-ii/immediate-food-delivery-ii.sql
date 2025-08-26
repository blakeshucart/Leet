/* Write your T-SQL query statement below */
WITH first_cust_order AS (
    SELECT customer_id, MIN(order_date) OVER (PARTITION BY customer_id) AS first_order
    FROM Delivery
),
first_orders AS (
    SELECT DISTINCT d.customer_id, d.order_date, d.customer_pref_delivery_date
    FROM Delivery AS d
    JOIN first_cust_order AS f ON f.customer_id = d.customer_id AND f.first_order = d.order_date
)


SELECT ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS immediate_percentage
FROM first_orders
