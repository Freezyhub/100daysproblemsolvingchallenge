-- Day 5_Use of operators(AND,OR,BETWEEN,NOT)
-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Retrive Total revenue of customers name that start with B and product line is  Classic Cars delivered via shippment (AND operator)
SELECT SALES_ID, CUSTOMERNAME, (PRICEEACH*SALES) AS TOTAL_REVENUE, STATUS
FROM Sales
where CUSTOMERNAME LIKE 'B%' AND  PRODUCTLINE = 'Classic Cars' AND STATUS = 'Shipped' ;

-- Retrieve customer information of Motorcycle sales or sales from france
SELECT CUSTOMERNAME, PRODUCTLINE, COUNTRY
FROM Sales
WHERE PRODUCTLINE = 'Motorcycles' OR Country = 'France';

-- Retrieve  price greater than 50 and the status of delivery is not shipped
SELECT CUSTOMERNAME, PRICEEACH, COUNTRY 
FROM Sales
WHERE PRICEEACH >50 AND STATUS NOT IN ('Shipped');

-- Retrieve quantity ordered for price items with the price between 70 and 80
SELECT SALES_ID, QUANTITYORDERED, PRICEEACH
FROM Sales
where PRICEEACH BETWEEN 70 AND 80;



