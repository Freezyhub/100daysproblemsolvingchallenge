-- Day 23_(Use of LEAD() function)

-- You are to analyze the quarterly revenue data of a company and want to identify product categories with a significant increase or decrease in revenue compared to the following quarter. However, you only want to consider categories where the revenue in the current quarter is higher than the average revenue of the past four quarters. create a query that retrieves the product category, quarter, total revenue, and indicates whether there was an increase or decrease in revenue compared to the next quarter within each category, considering only quarters with revenue above the average of the past four quarters.

SELECT 
    region,
    month,
    total_sales,
    CASE 
        WHEN total_sales > LEAD(total_sales, 1, 0) OVER (PARTITION BY region ORDER BY month) THEN 'Increase'
        WHEN total_sales < LEAD(total_sales, 1, 0) OVER (PARTITION BY region ORDER BY month) THEN 'Decrease'
        ELSE 'No Change' 
    END AS sales_trend
FROM (
    SELECT 
        region,
        month,
        SUM(sales_amount) AS total_sales
    FROM 
        sales_data
    GROUP BY 
        region,
        month
) AS monthly_sales_totals
WHERE total_sales > (
    SELECT AVG(total_sales) AS overall_avg_sales
    FROM (
        SELECT 
            region,
            month,
            SUM(sales_amount) AS total_sales
        FROM 
            sales_data
        GROUP BY 
            region,
            month
    ) AS avg_sales
);
