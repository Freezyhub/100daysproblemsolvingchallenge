-- Problem Statement: Allocate available discounts to customers based on their purchase history. Customers with higher total purchases should receive larger discounts.

-- select the right database
use supermarket_db;

-- Calculate the total purchases made by each customer
WITH CustomerTotalPurchases AS (
    SELECT customer_id, SUM(amount) AS total_purchase
    FROM orders
    GROUP BY customer_id
)
-- Select the order details along with the discount rate based on total purchases
SELECT o.order_id, o.customer_id, 
       CASE 
           WHEN ctp.total_purchase > 5000 THEN '20%' -- Apply 20% discount for total purchases over 5000
           WHEN ctp.total_purchase > 2000 THEN '15%' -- Apply 15% discount for total purchases over 2000 but less than 5000
           ELSE '10%' -- Apply 10% discount for total purchases of 2000 or less
       END AS discount_rate
FROM orders o
JOIN CustomerTotalPurchases ctp ON o.customer_id = ctp.customer_id;


