WITH tb1 AS
(
SELECT -- xếp hạng salary nhóm theo department 
      name
      ,salary
      ,department_id
      ,DENSE_RANK() OVER (PARTITION BY department_id 
      ORDER BY salary DESC) AS rank 
FROM employee
)
,
tb2 AS
(
SELECT -- filter top 3 lương cao bao gồm cả đồng hạng 
      name
      ,salary
      ,department_id
FROM tb1
WHERE rank <=3
)
  
SELECT
      d.department_name
      ,tb2.name
      ,tb2.salary
FROM tb2
LEFT JOIN department AS d 
ON tb2.department_id = d.department_id
ORDER BY d.department_name, tb2.salary DESC, tb2.name; 




-- top three salaries within that department.
-- output conditions:
-- 1. the employee's name along with their department name and salary. 
-- 2. duplicates -> sort department name in ascending order, salary in descending order
-- 3. multiple employees have the same salary -> order them alphabetically.
