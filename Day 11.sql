-- Day 11__( Use of IF statement)

-- SELECT THE RIGHT DATABASE
USE automobilesales_db;
-- Retrieve the total sales and the average price for each product line, showing 0 for any product line with no sales.
-- to ensure 0s show up, keeping our data clean and realistic, even when sales are missing. No more "NULL" party-poopers ruining our dataset!
SELECT 
    PRODUCTLINE, 
    COALESCE(SUM(SALES), 0) AS TotalSales, 
    COALESCE(AVG(PRICEEACH), 0) AS AveragePrice
FROM 
    Sales
GROUP BY 
    PRODUCTLINE;
    
-- For each customer, display the customer name, total quantity ordered, and classify the customer as 'High', 'Medium', or 'Low' based on the total sales (High >= 100000, Medium < 100000 and >= 60000, Low < 60000).
-- Implemented CASE to categorize customers based on their sales volume. It’s like giving our customers their own sales narrative!

SELECT 
    CUSTOMERNAME, 
    SUM(QUANTITYORDERED) AS TotalQuantityOrdered, 
    CASE 
        WHEN SUM(SALES) >= 100000 THEN 'High'
        WHEN SUM(SALES) >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS CustomerClass
FROM 
    Sales
GROUP BY 
    CUSTOMERNAME;
    
-- Display the MONTH, YEAR_ID, and a new column 'STATUS_Bonus' where you will add a bonus of 500 when STATUS is 'Shipped' for each sale record.
-- Used IF to smartly distribute 500 bonuses for shipped sales. Rewarding success has never been simpler in SQL town!
SELECT 
    MONTH, 
    YEAR_ID, 
    SALES,
    IF(STATUS ='Shipped', SALES + 500, SALES) AS STATUS_Bonus
FROM 
     Sales;
	
-- Display the number of sales for each shipped status category per month and classify each row into 'High Activity' (> 200 sales), 'Moderate Activity' (between 150 and 200 sales), or 'Low Activity' (< 150 sales) and sales that are not shipped as not successful.

    SELECT 
    MONTH,
    STATUS,
    COUNT(*) AS NumberOfSales,
    CASE 
        WHEN STATUS <> 'SHIPPED' THEN 'NOT SUCCESSFUL'
        WHEN COUNT(*) > 200 THEN 'High Activity'
        WHEN COUNT(*) BETWEEN 150 AND 200 THEN 'Moderate Activity'
        ELSE 'Low Activity'
    END AS ActivityLevel
FROM 
     Sales
WHERE 
    STATUS = 'SHIPPED' OR STATUS <> 'SHIPPED'
GROUP BY 
    MONTH, STATUS;

-- Calculate the average sale amount per country, including a label that classifies these averages into 'High' if above 5000, 'Medium' if between 3500 and 5000, and 'Low' otherwise.

SELECT 
    COUNTRY, 
    AVG(SALES) AS AvgSales, 
    CASE
        WHEN AVG(SALES) > 5000 THEN 'High'
        WHEN AVG(SALES) BETWEEN 3500 AND 5000 THEN 'Medium'
        ELSE 'Low'
    END AS SalesCategory
FROM 
    Sales
GROUP BY 
    COUNTRY;
