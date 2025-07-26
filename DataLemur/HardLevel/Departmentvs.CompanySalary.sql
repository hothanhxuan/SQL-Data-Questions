WITH company_avg AS
(
SELECT
      TO_CHAR(payment_date, 'MM-YYYY') AS payment_date
      ,ROUND(AVG(amount), 1) AS avg_salary_company_March2024
FROM salary
GROUP BY payment_date
HAVING EXTRACT(MONTH FROM payment_date) = 03
)
,
department_avg AS
(
SELECT 
      e.department_id
      ,TO_CHAR(s.payment_date, 'MM-YYYY') AS payment_date
      ,ROUND(AVG(s.amount),1) AS avg_by_department
FROM salary AS s
INNER JOIN employee AS e
ON s.employee_id = e.employee_id
GROUP BY department_id, s.payment_date
HAVING EXTRACT(MONTH FROM payment_date) = 03
)
SELECT 
      d.department_id
      ,d.payment_date
      ,CASE 
          WHEN d.avg_by_department > c.avg_salary_company_March2024 THEN 'higher'
          WHEN d.avg_by_department < c.avg_salary_company_March2024 THEN 'lower'
          ELSE 'same'
        END AS comparison 
FROM department_avg AS d
INNER JOIN company_avg AS c
ON d.payment_date = c.payment_date;


-- You work as a data analyst for a FAANG company that tracks employee salaries over time. 
-- The company wants to understand how the average salary in each department compares to the company's overall average salary each month.

-- Write a query to compare the average salary of employees in each department to the company's average salary for March 2024. 
-- Return the comparison result as 'higher', 'lower', or 'same' for each department. 
-- Display the department ID, payment month (in MM-YYYY format), and the comparison result.
