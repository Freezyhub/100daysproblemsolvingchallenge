
Day 16_(Use of Subquery/Nested subquery)

-- Task 1:calculate the total sales amount for each product.

SELECT 
    product_name,
    (SELECT SUM(sales_amount) 
     FROM sales 
     WHERE product_id = products.id) AS total_sales
FROM products;

-- Sumamry: This query calculate the total sales amount for each product by using a subquery in the SELECT section. The main query selects the product name from the products table.The subquery calculates the sum of sales amounts for each product by matching the product_id in the sales table with the product_id in the products table.This alloed me to retrieve the product name along with the total sales amount for each product.


-- Task 2: Retrieve customer names and their purchase amounts where the purchase amount is greater than the average purchase amount of all customers.

SELECT 
    customer_name,
    purchase_amount
FROM customers
WHERE purchase_amount > (
  							SELECT AVG(purchase_amount) 
  							FROM customers
						);
                            
-- Summary: This query retrieves customer names and their purchase amounts where the purchase amount is greater than the average purchase amount of all customers.The main query selects the customer name and purchase amount from the customers table.The subquery calculates the average purchase amount across all customers from the customers table.The WHERE clause filters the results to include only customers whose purchase amount exceeds the average purchase amount.

-- Task 3; Generate a summary of total sales per sales representative based on sales data.

SELECT 
    sales_rep,
    total_sales
FROM (
    SELECT 
        sales_rep,
        SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY sales_rep) AS sales_summary;

-- Summary: The subquery in the FROM section is used to generate a summary of total sales per sales representative.The subquery calculates the total sales amount for each sales representative by summing the sales amounts and grouping by sales_rep.The main query then selects the sales representative and the total sales from the subquery result set.
