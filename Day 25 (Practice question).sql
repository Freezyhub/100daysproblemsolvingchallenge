-- Day 25 (Practice question)
-- Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: Founder, Lead manager, Senior manager, Manager and Employee. Using the schema provided, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

SELECT 
    e.company_code,
    c.founder,
    (SELECT COUNT(DISTINCT lead_manager_code) 
     FROM lead_manager 
     WHERE company_code = e.company_code) AS total_lead_managers,
    (SELECT COUNT(DISTINCT senior_manager_code) 
     FROM senior_manager
     WHERE company_code = e.company_code) AS total_senior_managers,
    (SELECT COUNT(DISTINCT manager_code) 
     FROM manager 
     WHERE company_code = e.company_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM 
    employee e
JOIN 
   company c ON e.company_code = c.company_code
GROUP BY 
    e.company_code, c.founder
ORDER BY 
    e.company_code;

-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
-- Input Format

-- Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).
-- Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs

SELECT w.id, wp.age, w.coins_needed, w.power 
FROM Wands w 
JOIN Wands_Property wp ON w.code = wp.code 
JOIN ( SELECT w.power, wp.age, MIN(w.coins_needed) AS min_coins_needed 
      FROM Wands w JOIN Wands_Property wp ON w.code = wp.code 
      WHERE wp.is_evil = 0 
      GROUP BY w.power, wp.age ) AS min_coins ON w.power = min_coins.power 
      AND wp.age = min_coins.age 
      AND w.coins_needed = min_coins.min_coins_needed 
WHERE wp.is_evil = 0 
ORDER BY w.power DESC, wp.age DESC;