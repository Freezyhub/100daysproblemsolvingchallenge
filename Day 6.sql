-- Day 6__( Aggregate and collection functions)

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Retrive transactions distinct years
select distinct(YEAR_ID) AS TRANS_YEARS FROM Sales;

-- Calculate the total revenue generated in each distinct year.
SELECT distinct(YEAR_ID), SUM(PRICEEACH*SALES) AS TOTAL_REVENUE
FROM Sales
group by YEAR_ID;

-- Calculate average quantity ordered
SELECT AVG(QUANTITYORDERED) AS AVG_QORDERED
FROM Sales;

-- Retrieve the list of unique customers and their location
SELECT Distinct(CUSTOMERNAME), COUNTRY FROM Sales;

-- Retrieve the minimum order from USA
SELECT min(QUANTITYORDERED) AS MINIMUM_ORDER, CUSTOMERNAME, COUNTRY
FROM Sales
WHERE COUNTRY = 'France';