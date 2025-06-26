WITH tb1 AS
(
SELECT 
      measurement_time::date AS measurement_date
      , measurement_value
      ,ROW_NUMBER() OVER (
      PARTITION BY measurement_time::date
      ORDER BY measurement_time) AS rank
FROM measurements
)
SELECT 
      measurement_date
      ,SUM(CASE WHEN rank % 2 <> 0 THEN measurement_value END) AS odd_sum
      ,SUM(CASE WHEN rank % 2 = 0 THEN measurement_value END) AS even_sum
FROM tb1
GROUP BY measurement_date;


-- calculate the sum of odd-numbered (lẻ) and even-numbered(chẵn) measurements separately for a particular day 
-- and display the results in two different columns. 

-- Definition:
-- Within a day, 
-- measurements taken at 1st, 3rd, and 5th times -> odd-numbered measurements
-- measurements taken at 2nd, 4th, and 6th times -> even-numbered measurem

-- step1: chuyển measurement_time thành measurement_date >> measurement_time::date 
-- step2: đếm số lần >> row_number nhóm theo measurement_time >> rank 
-- step3: lấy ra chẳn và lẻ >> case when rank chia hết cho 2 và ngược lại 

