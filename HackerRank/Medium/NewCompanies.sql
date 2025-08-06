WITH tb1 AS
    (SELECT C.company_code, C.founder, L.lead_manager_code
    FROM Company AS C
    LEFT JOIN Lead_Manager AS L
    ON C.company_code = L.company_code 
    ORDER BY C.company_code) 
