-- Day 49 (Business problem practice)

-- Business Problem: You are a data analyst at a fintech company that offers a peer-to-peer lending platform. Your platform connects borrowers with individual lenders, facilitating loans for various purposes such as personal expenses, small businesses, and debt consolidation. As part of your role, you need to analyze loan performance, identify risk factors, and optimize the lending process to maximize returns for investors while minimizing default rates.

-- Problem Statement: Design a comprehensive analysis of loan performance on your platform, focusing on factors such as borrower characteristics, loan attributes, repayment behavior, and default rates. Your analysis should provide insights into the drivers of loan defaults, segment borrowers based on risk profiles, and recommend strategies to improve loan portfolio quality.


-- Problem Statement: Analyze loan performance on the platform

-- Retrieve data on loan transactions
SELECT
    loan_id,
    borrower_id,
    loan_amount,
    interest_rate,
    term,
    repayment_status,
    default_status
FROM
    loans;

-- Calculate default rates on the platform
SELECT
    AVG(CASE WHEN default_status = 'defaulted' THEN 1 ELSE 0 END) AS default_rate
FROM
    loans;

-- Problem Statement: Segment borrowers based on characteristics

-- Segment borrowers based on credit score
SELECT
    CASE
        WHEN credit_score >= 700 THEN 'High Credit Score'
        WHEN credit_score >= 600 AND credit_score < 700 THEN 'Medium Credit Score'
        ELSE 'Low Credit Score'
    END AS credit_score_segment,
    AVG(CASE WHEN default_status = 'defaulted' THEN 1 ELSE 0 END) AS default_rate
FROM
    borrowers
JOIN
    loans ON borrowers.borrower_id = loans.borrower_id
GROUP BY
    credit_score_segment;


-- Analyze factors contributing to loan defaults
SELECT
    loan_amount,
    interest_rate,
    term,
    employment_status,
    AVG(CASE WHEN default_status = 'defaulted' THEN 1 ELSE 0 END) AS default_rate
FROM
    loans
JOIN
    borrowers ON loans.borrower_id = borrowers.borrower_id
GROUP BY
    loan_amount, interest_rate, term, employment_status;

-- Problem Statement: Recommend strategies to mitigate default risk

-- Recommendations include adjusting loan eligibility criteria, offering personalized interest rates, and enhancing borrower education programs.

