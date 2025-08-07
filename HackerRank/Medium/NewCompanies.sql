SELECT 
    C.company_code, C.founder
    ,COUNT(DISTINCT L.lead_manager_code) AS lead_manager_count
    ,COUNT(DISTINCT S.senior_manager_code) AS senior_manager_count
    ,COUNT(DISTINCT M.manager_code) AS manager_count
    ,COUNT(DISTINCT E.employee_code) AS employee_count
FROM Company AS C
LEFT JOIN Lead_Manager AS L
    ON C.company_code = L.company_code
LEFT JOIN Senior_Manager AS S
    ON L.company_code = S.company_code
LEFT JOIN Manager AS M
    ON S.company_code = M.company_code
LEFT JOIN Employee AS E
    ON M.company_code = E.company_code
GROUP BY C.company_code
ORDER BY C.company_code


-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, 
-- total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
-- Note:
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, 
-- then the ascending company_codes will be C_1, C_10, and C_2.
