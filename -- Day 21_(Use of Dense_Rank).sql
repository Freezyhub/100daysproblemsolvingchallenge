-- Day 21_(Use of Dense_Rank)

-- You're analyzing the performance of sales representatives and want to rank them based on their total sales amounts, ensures consecutive rank values even in cases of tied sales amounts.

SELECT
    salesperson,
    SUM(sales_amount) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS dense_sales_rank
FROM
    sales
GROUP BY
    salesperson;


-- You're evaluating student performance in a class and need to determine their rankings based on exam scores, ensure consecutive rank values in case of tied scores.

SELECT
    student_id,
    exam_score,
    DENSE_RANK() OVER (ORDER BY exam_score DESC) AS dense_exam_rank
FROM
    exam_scores;
