WITH cnt_unique_queries AS
(
SELECT 
      e.employee_id
      ,COALESCE(COUNT(DISTINCT query_id),0) AS unique_query
FROM employees AS e
LEFT JOIN queries AS q
ON e.employee_id = q.employee_id
  AND q.query_starttime BETWEEN '07/01/2023' AND '10/01/2023'
GROUP BY e.employee_id)

SELECT
      unique_query
      ,COUNT(employee_id) AS employee_count
FROM cnt_unique_queries
GROUP BY unique_query
ORDER BY unique_query;


-- BM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
-- The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September).
-- Additionally, it should count the number of employees who did not run any queries during this period.

-- Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.
