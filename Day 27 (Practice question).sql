-- Day 27 (Practice question)

-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.The STATION table is described as ID, CITY, STATE, LAT_N, LONG_W. where LAT_N is the northern latitude and LONG_W is the western longitude.
SELECT ROUND(LAT_N, 4) AS Median_Northern_Latitude
FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS Row_Num,
           COUNT(*) OVER () AS Total_Count
    FROM STATION
	) AS sub
WHERE Row_Num IN ((Total_Count + 1) / 2, (Total_Count + 2) / 2);

-- Given three tables: salesperson, company, orders.Output all the names in the table salesperson, who didn’t have sales to company 'RED'.

SELECT 
     NAME  
FROM 
   SALESPERSON
WHERE
    SALES_ID NOT IN ( SELECT
                     		SALES_ID
                       FROM 
                     		ORDERS
                       WHERE COM_ID=1);