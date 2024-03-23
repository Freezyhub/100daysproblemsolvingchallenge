-- Day 4 (Use of where and Operators(=,<, <, >=, LIKE))

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Retrive name of customer with orders greater or equal to 50

SELECT SALES_ID,CUSTOMERNAME, QUANTITYORDERED 
FROM Sales
WHERE QUANTITYORDERED >= 50;

-- Retrieve price of comodity lower than 50
SELECT SALES_ID, PRICEEACH AS PRICESBELOW50
FROM Sales
WHERE PRICEEACH < 50;

-- Calculate the total revenue for each transaction
SELECT SALES_ID, CUSTOMERNAME, PRICEEACH*SALES
 AS TOTAL_REVENUE 
 FROM Sales;

-- Retrive customer name that start with B 
SELECT CUSTOMERNAME FROM Sales
 where CUSTOMERNAME LIKE 'b%';


-- Retrive customer name and total revenue of customer that purchase classic cars
SELECT SALES_ID, CUSTOMERNAME, PRICEEACH*SALES AS TOTAL_REVENUE, PRODUCTLINE
FROM Sales
where PRODUCTLINE = 'Classic Cars'
