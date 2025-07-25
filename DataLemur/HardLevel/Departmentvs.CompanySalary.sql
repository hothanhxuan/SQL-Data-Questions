SELECT
      ROUND(AVG(amount), 1) AS avg_salary_company_March2024
FROM salary
GROUP BY payment_date
HAVING EXTRACT(MONTH FROM payment_date) = 03;
