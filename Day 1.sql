
-- (Day 1- Creating a Database, Defining Table, and Choosing Appropriate Data Types for Column Fields)

-- The SQL CREATE DATABASE syntax serves as the gateway to create a new database, providing the foundation for data storage and management. 
-- By understanding the hints of this syntax and following best practices, you can create databases that are well-structured, secure, and optimized for your specific use cases.

-- CHECK IF THE PROPOSED DATABASE EXIST, THEN IT WILL BE DELETED 
DROP DATABASE IF EXISTS AUTOMOBILESALES_DB;

-- CREATE DATABASE WITH THE NAME automobilesales_db
CREATE DATABASE AUTOMOBILESALES_DB;

-- select the right database
USE AUTOMOBILESALES_DB;

-- Creating a table named "sales" to store sales data and selecting the right data types for each column
CREATE TABLE sales (
  sales_ID INTEGER(5) NOT NULL PRIMARY KEY,
  RRVVVV INTEGER,
  QUANITYORDERED INTEGER,
  PRICEEACH DECIMAL(10,2),
  SALES DECIMAL(10,2),
  MONTH_ID INTEGER,
  MONTH_ VARCHAR(10),
  YEAR_ID INTEGER(5),
  PRODUCTLINE VARCHAR(15),
  CUSTOMERNAME VARCHAR(50),
  COUNTRY VARCHAR(10)
);
-- When working with MySQL, one of the fundamental tasks is to create a database and define tables within it. 
-- This process involves not only setting up the structure of the database but also choosing the right data 
-- types for the columns in the tables. Proper data type selection is crucial for optimizing storage, ensuring data integrity, and improving query performance.
