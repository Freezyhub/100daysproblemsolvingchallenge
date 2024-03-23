-- Day 9__( Use of string functions) contd

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Right-pad the product line with '*' to a total length of 20 characters
   SELECT RPAD(PRODUCTLINE, 20, '*') AS PaddedProductLine 
   FROM Sales;
   
-- Left-trim whitespace from the customer names.
   SELECT Ltrim(CUSTOMERNAME) AS TrimmedCustomerName 
   FROM Sales;
   
-- Find the substring 'car' in the product line.
   SELECT PRODUCTLINE, LOCATE('car', PRODUCTLINE) AS SubstringLoc 
   FROM Sales;
   
-- Format the sales value as a currency with two decimal places.
    SELECT SALES_ID, CUSTOMERNAME, FORMAT(SALES, 2) AS FormattedSales 
    FROM Sales;
    
 -- Retrieve the longest customer name and the total sales for that customer?
    SELECT CUSTOMERNAME, LENGTH(CUSTOMERNAME) AS NameLength, SUM(SALES) AS TotalSales 
    FROM Sales 
    GROUP BY CUSTOMERNAME
    ORDER BY NameLength DESC
    LIMIT 1;
    
-- Retrieve th list the minimum and maximum sales amount for each country, with the country names in lowercase?
   SELECT Lower(COUNTRY) AS Country, MIN(SALES) AS MinSales, MAX(SALES) AS MaxSales 
   FROM Sales 
   GROUP BY COUNTRY;

-- Calculate the sum of sales for each month, where the month name starts with 'J', and display the month names in uppercase?
   SELECT UPPER(MONTH) AS MonthUpper, SUM(SALES) AS TotalSales 
   FROM Sales 
   WHERE MONTH LIKE 'J%' 
   GROUP BY MONTH;
   
-- Calculate the total number of sales transactions for each status, where the status includes the substring 'Shipped'?
   SELECT STATUS, COUNT(*) AS NumberOfSales 
   FROM Sales 
   WHERE STATUS LIKE '%Shipped%' 
   GROUP BY STATUS;