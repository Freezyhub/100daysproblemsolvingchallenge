-- Day 30 ( Date and Time functions)

Retrieve the names of employees who joined the company today.
SELECT name
FROM employees
WHERE join_date = CURRENT_DATE();

Find the total number of orders placed in the last 24 hours.
SELECT COUNT(*)
FROM orders
WHERE order_date >= DATEADD(day, -1, GETDATE());

Retrieve the IDs of customers who placed an order today in an Oracle database.
SELECT customer_id
FROM orders
WHERE TRUNC(order_date) = TRUNC(SYSDATE);

List the names of employees who logged in to the system within the last hour.
SELECT name
FROM employees
WHERE login_time >= CURTIME() - INTERVAL 1 HOUR;


Find the total number of transactions recorded within the last 30 minutes.
SELECT COUNT(*)
FROM transactions
WHERE transaction_time >= CURRENT_TIME() - INTERVAL 30 MINUTE;

Retrieve the details of products added to inventory within the last 1 hour and 30 minutes.
SELECT *
FROM inventory
WHERE added_timestamp >= NOW() - INTERVAL 1 HOUR - INTERVAL 30 MINUTE;


