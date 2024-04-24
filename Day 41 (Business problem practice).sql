-- Day 41 (Business problem practice)

-- Problem Statement: Calculate the profit sharing amount for each employee based on their contribution to the sales. Each employee's share should be calculated as a percentage of the total profit generated.

-- select the company database
 use marketing_db;

-- Calculate the total profit from sales
WITH TotalProfit AS (
    SELECT SUM(profit) AS total_profit
    FROM sales
),
-- Calculate the profit contributed by each employee
EmployeeContribution AS (
    SELECT employee_id, SUM(profit) AS employee_profit
    FROM sales
    GROUP BY employee_id
)
-- Calculate the profit sharing percentage for each employee
SELECT e.employee_id, e.employee_name, 
       (ec.employee_profit / tp.total_profit) * 100 AS profit_share_percentage
FROM EmployeeContribution ec
-- Use CROSS JOIN to combine the total profit with each employee's contribution
CROSS JOIN TotalProfit tp
-- Join with the employees table to get employee details
JOIN employees e ON ec.employee_id = e.employee_id;
