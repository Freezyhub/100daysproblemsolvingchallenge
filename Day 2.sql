-- SELECT THE RIGHT DATABASE
USE automobilesales_db;

-- Inserting sales data into the "sales" table
-- Method of inserting values into the tables

-- METHOD I (Insert Method)
INSERT INTO sales (
SALES_ID, RRVVVV, QUANTITYORDERED, PRICEEACH, SALES, STATUS, MONTH_ID, MONTH, YEAR_ID, PRODUCTLINE, CUSTOMERNAME, COUNTRY
)
 VALUES(
 1,10107,30,95.7,2871,'shipped',2,'February',2023,'Motorcycles','land of Toys Inc.'
 );
                            
-- METHOD II (Load Infile Method)
SET GLOBAL LOCAL_INFILE = true;

LOAD DATA LOCAL INFILE 'C:\Users\richa\Desktop\100Dayschallenge/sales.csv'
INTO TABLE adverts
FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES
TERMINATED BY '\n'
IGNORE 1 ROWS;

-- METHOD III ( MySQLImport and Export Wizard)
	-- double-click required database.
	-- right-click the Table.
	-- select the Table data import wizard.
    -- follow the prompt messages.
    
    --  i spent Day 2 to explore the different method of loading data into the database. The methods explored include the Insert Method, 
    -- Load Infile Method, and Import and Export Wizard for MySQL. Each method offers distinct benefits, 
    -- with the Insert Method providing fine-grained control for small-scale data entry, the Load Infile 
    -- Method efficiently importing large volumes of structured data from external files, and the Import 
    -- and Export Wizard for MySQL offering a user-friendly, graphical interface for step-by-step data import. 
    -- These methods cater to different data import requirements and user preferences.