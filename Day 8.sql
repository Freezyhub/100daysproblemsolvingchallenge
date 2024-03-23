-- Day 8__( Use of string functions)

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Find the length of each customer names?
   SELECT Distinct(CUSTOMERNAME), LENGTH(CUSTOMERNAME) AS NameLength 
   FROM Sales
   ORDER BY NameLength;
   
-- Convert all customer names to uppercase?
   SELECT UPPER(CUSTOMERNAME) AS CustomerNameUpper 
   FROM Sales;
   
-- Extract the first 3 characters from the month?
   SELECT SUBSTRING(MONTH, 1, 3) AS Month_
   FROM Sales;
   
-- Replace 'RRVVVV' with 'RRWWWW' in the RRVVVV column?
   SELECT REPLACE(RRVVVV, 'RRVVVV', 'RRWWWW') AS InvoiceNo 
   FROM Sales;
   
-- Retrieve the position of 'a' in the country names and rename the column RRVVVV and InvoiceNo.
   SELECT SALES_ID, 
   REPLACE(RRVVVV, 'RRVVVV', 'RRWWWW') AS InvoiceNo, COUNTRY,INSTR(COUNTRY, 'a') AS PositionOfA 
   FROM Sales;
   
-- Merge the first 3 letters of the month and year separated by a /.
   SELECT SALES_ID, CUSTOMERNAME, CONCAT((SUBSTRING(MONTH, 1, 3)), '/', YEAR_ID) AS MonthYear 
   FROM Sales;