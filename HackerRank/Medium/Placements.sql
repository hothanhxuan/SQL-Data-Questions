SELECT Name
FROM
(
  SELECT tb1.ID, tb1.Name, tb1.Salary, tb2.Friend_ID, tb2.Salary AS Friend_Salary
  FROM
    (
    SELECT S.ID, S.Name, P.Salary
    FROM Students S
    LEFT JOIN Packages P
    ON S.ID = P.ID
    ) AS tb1
  LEFT JOIN 
    (
    SELECT F.ID, P.Salary, F.Friend_ID
    FROM Friends F
    LEFT JOIN Packages P
    ON F.Friend_ID = P.ID
    ) AS tb2
  ON tb1.ID = tb2.ID 
  HAVING tb2.Salary > tb1.Salary
  
) AS filtered
  
ORDER BY Friend_Salary; 

-- You are given three tables: Students, Friends and Packages. 
-- Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
-- Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends. 
-- It is guaranteed that no two students got same salary offer.
