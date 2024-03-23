-- Day 7__( Aggregate and collection functions_Orderby)

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Retrive the total number of cutomers
SELECT COUNT(Distinct CUSTOMERNAME)AS CUSTOMER_COUNT
FROM Sales;

-- Calculate the top 5 customer with the highest total revenue
SELECT DISTINCT(CUSTOMERNAME) AS CUSTOMER, sum(PRICEEACH*SALES) AS TOTAL_REVENUE
FROM Sales 
GROUP BY CUSTOMER
order by TOTAL_REVENUE desc
lIMIT 5;

-- What is the total sales amount for each product line?
SELECT PRODUCTLINE, SUM(SALES) AS TOTAL_SALES
   FROM sales
   GROUP BY PRODUCTLINE;
   
   -- Retrive customer with the lowewest sales recorded
SELECT SALES_ID, CUSTOMERNAME, SALES
FROM Sales
ORDER by SALES ASC
LIMIT 1;

-- calculate the customer with the higest revenue
SELECT SALES_ID, CUSTOMERNAME, SALES, YEAR_ID
FROM Sales
ORDER BY SALES DESC
LIMIT 1;
		