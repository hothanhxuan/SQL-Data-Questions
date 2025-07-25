SELECT
      ROUND(AVG(amount), 1) AS avg_salary_company_March2024
FROM salary
GROUP BY payment_date
HAVING EXTRACT(MONTH FROM payment_date) = 03;


-- You work as a data analyst for a FAANG company that tracks employee salaries over time. 
-- The company wants to understand how the average salary in each department compares to the company's overall average salary each month.

-- Write a query to compare the average salary of employees in each department to the company's average salary for March 2024. 
-- Return the comparison result as 'higher', 'lower', or 'same' for each department. 
-- Display the department ID, payment month (in MM-YYYY format), and the comparison result.
