-- Day 45-46 (Business problem practice)

-- Problem Statement: Analyze the profit margins for each product category and identify areas where margins can be improved to increase overall profitability.

WITH ProductProfitMargin AS (
    SELECT product_category, 
           AVG(profit_margin) AS avg_profit_margin
    FROM products
    GROUP BY product_category
)
SELECT product_category, avg_profit_margin
FROM ProductProfitMargin
ORDER BY avg_profit_margin DESC;