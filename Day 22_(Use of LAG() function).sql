-- Day 22_(Use of LAG() function)

-- You're tasked to analyse weekly website traffic data and want to identify weeks with a significant increase or decrease in traffic compared to the previous week for each page.write a query that retrieves the page, week, number of visits, and indicates whether there was an increase or decrease in visits compared to the previous week.

SELECT 
    page,
    week,
    visits,
    CASE 
        WHEN visits > LAG(visits, 1, 0) OVER (PARTITION BY page ORDER BY week) THEN 'Increase'
        WHEN visits < LAG(visits, 1, 0) OVER (PARTITION BY page ORDER BY week) THEN 'Decrease'
        ELSE 'No Change' 
    END AS traffic_change
FROM 
    website_traffic;


-- Analyze the monthly sales performance of different regions and calculate the difference in sales between consecutive months within each region. write a query that retrieves the month, region, sales amount, and the difference in sales from the previous month.

SELECT 
    region,
    month,
    sales_amount,
    LAG(sales_amount, 1, 0) OVER (PARTITION BY region ORDER BY month) AS previous_month_sales,
    sales_amount - LAG(sales_amount, 1, 0) OVER (PARTITION BY region ORDER BY month) AS sales_difference
FROM 
    monthly_sales;
    
-- Analyze the quarterly performance of various product categories and identify categories with a significant increase or decrease in sales compared to the previous quarter. Using SQL, create a query that retrieves the category, quarter, sales amount, and indicates whether there was an increase or decrease in sales compared to the previous quarter.

SELECT 
    category,
    quarter,
    sales_amount,
    CASE 
        WHEN sales_amount > LAG(sales_amount, 1, 0) OVER (PARTITION BY category ORDER BY quarter) THEN 'Increase'
        WHEN sales_amount < LAG(sales_amount, 1, 0) OVER (PARTITION BY category ORDER BY quarter) THEN 'Decrease'
        ELSE 'No Change' 
    END AS sales_change
FROM 
    quarterly_sales;



