-- Day 19 (Rolling Total)

-- you work in a financial institution and need to analyze the daily investment returns for various portfolios. Create a query that calculates the rolling total return for each portfolio, assigns a rank based on the total return, and identifies the top-performing portfolio for each month.

SELECT
       portfolio,
       date,
       return,
       SUM(return) OVER (PARTITION BY portfolio ORDER BY date) AS rolling_total_return,
       RANK() OVER (PARTITION BY date ORDER BY SUM(return) DESC) AS portfolio_rank
FROM
       portfolio_returns
GROUP BY
       portfolio, date;
       
       
-- As a healthcare analyst, you are tasked with monitoring patient admissions across different departments in a hospital. Develop a query that computes the rolling total number of admissions for each department, assigns a rank based on the total admissions, and determines the department with the highest number of admissions in the past quarter.

SELECT
       department,
       admission_date,
       COUNT(patient_id) AS admissions,
       SUM(COUNT(patient_id)) OVER (PARTITION BY department ORDER BY admission_date) AS rolling_total_admissions,
       RANK() OVER (PARTITION BY admission_date ORDER BY SUM(COUNT(patient_id)) DESC) AS department_rank
FROM
       patient_admissions
GROUP BY
       department, admission_date;