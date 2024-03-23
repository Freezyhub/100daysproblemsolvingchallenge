-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Retrive all columns from the sales table
SELECT * 
FROM sales;

-- Retrive selected column from the sales table
SELECT SALES_ID, CUSTOMERNAME, COUNTRY, YEAR_ID,SALES
FROM sales;

-- Retrieve each transaction sales_id and their respective customer names
SELECT SALES_ID, CUSTOMERNAMES
FROM sales;

-- Retrive customer names and their location
SELECT CUSTOMERNAME, COUNTRY
FROM sales;

-- Retrieve list of customers name, items purchased, year of transaction and location
SELECT CUSTOMERNAME, PRODUCTLINE, YEAR_ID, COUNTRY
FROM sales;