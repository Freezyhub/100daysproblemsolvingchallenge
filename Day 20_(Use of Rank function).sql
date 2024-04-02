Day 20_(Use of Rank function)

-- You are managing a sales database and need to analyze the performance of your sales team. create a query that ranks the sales representatives based on their total sales amount and provides a corresponding sales rank. Additionally, calculate the cummulative sum of sales amounts for each representative.


SELECT
    salesperson,
    SUM(sales_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank,
    SUM(sales_amount) OVER (PARTITION BY salesperson ORDER BY salesperson DESC) AS rolling_total
FROM
    sales
GROUP BY
    salesperson;


-- you are analyzing the performance of students in a class, you are to determine their rankings based on their scores in an exam.create a query that assigns a row number to each student based on their score, provides their exam rank, and calculates the rolling total of scores.

SELECT
    student_id,
    exam_score,
    ROW_NUMBER() OVER (ORDER BY exam_score DESC) AS score_rating,
    RANK() OVER (ORDER BY exam_score DESC) AS exam_rank,
    SUM(exam_score) OVER (PARTITION BY student_id ORDER BY student_id DESC) AS rolling_total
FROM
    exam_scores;
