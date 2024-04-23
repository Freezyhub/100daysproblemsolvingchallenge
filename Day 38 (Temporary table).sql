-- Day 38 (Temporary table)

-- Business Problem: A retail company wants you to analyze its sales data to identify customers who have made multiple purchases within the last month. The company aims to target these loyal customers with special promotions to enhance customer retention and increase sales.

-- To solve this problem, we can use a temporary table to store the list of loyal customers who have made more than one purchase within the last month. We'll then join this temporary table with the main sales table to fetch the relevant customer details and sales data.

-- Create a temporary table to store loyal customers
CREATE TEMPORARY TABLE loyal_customers AS
SELECT customer_id
FROM sales
WHERE purchase_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1;

-- Retrieve customer details and sales data for targeted promotions
SELECT c.customer_id, c.customer_name, s.order_id, s.purchase_date, s.total_amount
FROM loyal_customers c
JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_id, s.purchase_date;
