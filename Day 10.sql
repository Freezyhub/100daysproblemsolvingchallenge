-- Day 10__( Use of IF statement)

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Find the total quantity ordered for each year, but only include the 'Motorcycles' product line.
SELECT YEAR_ID, SUM(IF(PRODUCTLINE = 'Motorcycles', QUANTITYORDERED, 0)) AS TotalQuantity
FROM Sales
GROUP BY YEAR_ID;

-- Calculate the average sales for each country, excluding orders with a 'Cancelled' status.
SELECT COUNTRY, AVG(IF(STATUS <> 'Cancelled', SALES, NULL)) AS AvgSales
FROM Sales
GROUP BY COUNTRY;
select distinct PRODUCTLINE from Sales;
-- List each customer's highest single order sale, only for orders within the 'Planes' product line.
SELECT CUSTOMERNAME, MAX(IF(PRODUCTLINE = 'Planes', SALES, NULL)) AS HighestPlaneSale
FROM Sales
GROUP BY CUSTOMERNAME;

-- Determine the total sales for each month, but only for the 'Ships' product line.
SELECT MONTH, SUM(IF(PRODUCTLINE = 'Ships', SALES, 0)) AS TotalSales
FROM Sales
GROUP BY MONTH;

-- Find the average quantity ordered for each country, only for orders with a status of 'Shipped'.
SELECT COUNTRY, AVG(IF(STATUS = 'Shipped', QUANTITYORDERED, NULL)) AS AvgQuantity
FROM Sales
GROUP BY COUNTRY;

-- Determine the maximum price for each month, only considering orders with more than 50 items ordered.
SELECT MONTH, MAX(IF(QUANTITYORDERED > 50, PRICEEACH, NULL)) AS MaxPrice
FROM Sales
GROUP BY MONTH;

-- List the number of orders for each customer, but count only the orders with sales greater than $5000.
SELECT CUSTOMERNAME, COUNT(IF(SALES > 5000, SALES_ID, NULL)) AS NumberOfHighOrders
FROM Sales
GROUP BY CUSTOMERNAME;


