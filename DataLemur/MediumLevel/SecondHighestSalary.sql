SELECT 
      salary AS sencond_highest_salary
FROM
    (
    SELECT 
      employee_id
      ,salary
      ,DENSE_RANK() OVER (ORDER BY salary) AS rank  
    FROM employee
    ORDER BY rank DESC
    ) AS defind_second_highest
WHERE rank = 11;


-- determine the second highest salary among all employees.
