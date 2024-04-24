-- Day 39-40 (Practice question temporary table)

-- Business Problem: A retail store is facing challenges in managing its inventory effectively. The store receives new shipments of products daily and needs to update its inventory records to reflect the current stock levels accurately. The store also wants to analyze sales data to identify slow-moving items and make informed purchasing decisions.

-- Problem Statement: Update inventory records with new stock quantities from daily shipments, Identify and list slow-moving items based on sales data and Generate a report showing products that need restocking.


-- Step 1: Create a Temporary Table to store daily shipment data
CREATE TEMPORARY TABLE DailyShipments (
    ProductID INT,
    ProductName VARCHAR(50),
    Quantity INT
);

-- Insert sample data into DailyShipments table
INSERT INTO DailyShipments (ProductID, ProductName, Quantity)
VALUES
    (1, 'Laptop', 20),
    (2, 'Mobile Phone', 30),
    (3, 'Headphones', 50);

-- Step 2: Update main inventory table with new stock quantities
UPDATE Inventory
SET Quantity = Quantity + ds.Quantity
FROM Inventory
JOIN DailyShipments ds ON Inventory.ProductID = ds.ProductID;

-- Step 3: Identify slow-moving items
CREATE TEMPORARY TABLE SlowMovingItems AS
SELECT 
    ProductID,
    ProductName,
    SUM(Quantity) AS TotalSales
FROM Sales
GROUP BY ProductID, ProductName
HAVING SUM(Quantity) < 10; -- Products with less than 10 units sold

-- Step 4: Generate a report on products needing restocking
SELECT 
    i.ProductID,
    i.ProductName,
    i.Quantity AS CurrentStock,
    COALESCE(s.TotalSales, 0) AS TotalSales
FROM Inventory i
LEFT JOIN SlowMovingItems s ON i.ProductID = s.ProductID
WHERE i.Quantity < 50; -- Products with less than 50 units in stock