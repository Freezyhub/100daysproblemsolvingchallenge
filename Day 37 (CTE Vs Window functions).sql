-- Day 37 (CTE Vs Window functions)

-- Case Study: You work for a retail company that sells products in multiple categories across various regions. The company wants to analyze its sales performance by category and region to identify which categories and regions are generating the highest revenue.

-- Objective: Create a report that shows the total sales revenue for each product category within each region, sorted by total revenue in descending order.

-- Solution with CTE
WITH SalesByCategoryRegion AS (
    SELECT
        region,
        category,
        SUM(sales_amount) AS total_sales
    FROM
        sales
    GROUP BY
        region, category
)

SELECT
    region,
    category,
    total_sales
FROM
    SalesByCategoryRegion
ORDER BY
    region ASC,
    total_sales DESC;

    
-- Solution using Window Function.

SELECT
    region,
    category,
    SUM(sales_amount) AS total_sales,
    RANK() OVER(PARTITION BY region ORDER BY SUM(sales_amount) DESC) AS 		rank_by_region
FROM
    sales
GROUP BY
    region, category
ORDER BY
    region ASC,
    total_sales DESC;

