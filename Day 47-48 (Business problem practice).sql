-- Day 47-48 (Business problem practice)

-- Problem Statement: Design a SQL query to generate a shift routine for 10 staff members over a month. Each staff member must have exactly two days off within the month, and all staff members should work the same number of days. Ensure that there is no repetition of shifts for any staff member. 

-- Step 1: Create a Common Table Expression (CTE) to generate a list of dates for the month
WITH DateList AS (
    SELECT DATEADD(DAY, number - 1, '2024-04-01') AS ShiftDate
    FROM master..spt_values
    WHERE TYPE = 'P'
    AND DATEADD(DAY, number - 1, '2024-04-01') < '2024-05-01' -- Limit dates to April 2024
),

-- Step 2: Create a temporary table to hold the initial shift assignments
InitialShifts AS (
    SELECT 
        Staff_ID, 
        ShiftDate,
        ROW_NUMBER() OVER (PARTITION BY Staff_ID ORDER BY ShiftDate) AS ShiftNumber
    FROM DateList
    CROSS JOIN (SELECT DISTINCT Staff_ID FROM Staff) AS StaffList
),

-- Step 3: Adjust the shift numbers to ensure each staff has 2 days off and equal working days
AdjustedShifts AS (
    SELECT 
        Staff_ID,
        ShiftDate,
        CASE 
            WHEN ShiftNumber <= 20 THEN 'Working'  -- Assuming 2 days off per staff
            ELSE 'Off'
        END AS Shift_Type
    FROM InitialShifts
),

-- Step 4: Assign a unique shift ID to each shift
FinalShifts AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY ShiftDate, Staff_ID) AS Shift_ID,
        Staff_ID,
        ShiftDate,
        Shift_Type
    FROM AdjustedShifts
)

-- Step 5: Insert the final shift assignments into the Shifts table
INSERT INTO Shifts (Shift_ID, Staff_ID, ShiftDate, Shift_Type)
SELECT Shift_ID, Staff_ID, ShiftDate, Shift_Type
FROM FinalShifts;
