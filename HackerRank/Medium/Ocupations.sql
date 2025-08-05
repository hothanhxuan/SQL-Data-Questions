With tb1 AS    
    (SELECT 
        CASE WHEN Occupation = 'Doctor' THEN Name END AS D
        ,ROW_NUMBER() OVER() AS rn 
    FROM OCCUPATIONS
    HAVING D IS NOT NULL
    ORDER BY Name ASC)
,
tb2 AS
    (SELECT 
        CASE WHEN Occupation = 'Professor' THEN Name END AS P
        ,ROW_NUMBER() OVER() AS rn 
    FROM OCCUPATIONS
    HAVING P IS NOT NULL
    ORDER BY Name ASC)
,
tb3 AS    
    (SELECT 
        CASE WHEN Occupation = 'Singer' THEN Name END AS S
        ,ROW_NUMBER() OVER() AS rn 
    FROM OCCUPATIONS
    HAVING S IS NOT NULL
    ORDER BY Name ASC) 
,
tb4 AS   
    (SELECT 
        CASE WHEN Occupation = 'Actor' THEN Name END AS A
        ,ROW_NUMBER() OVER() AS rn 
    FROM OCCUPATIONS
    HAVING A IS NOT NULL
    ORDER BY Name ASC)
,
tb12 AS -- Union tb1 and tb2
    (SELECT tb1.rn, tb1.D, tb2.P
    FROM tb1 
    LEFT JOIN tb2 ON tb1.rn = tb2.rn
    UNION
    SELECT tb2.rn, tb1.D, tb2.P
    FROM tb2
    LEFT JOIN tb1 ON tb1.rn = tb2.rn)
,
tb123 AS -- UNION tb12 and tb3
    (SELECT tb12.rn, tb12.D, tb12.P, tb3.S
    FROM tb12
    LEFT JOIN tb3 ON tb12.rn = tb3.rn
    UNION 
    SELECT tb3.rn, tb12.D, tb12.P, tb3.S
    FROM tb3
    LEFT JOIN tb12 ON tb12.rn = tb3.rn)
,       
tb1234 AS -- UNION tb123 and tb4
    (SELECT tb123.rn, tb123.D, tb123.P, tb123.S, tb4.A
    FROM tb123
    LEFT JOIN tb4 ON tb123.rn = tb4.rn
    UNION
    SELECT tb4.rn, tb123.D, tb123.P, tb123.S, tb4.A
    FROM tb4
    LEFT JOIN tb123 ON tb123.rn = tb4.rn)

SELECT D,P,S,A
FROM tb1234
ORDER BY rn;


-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
-- The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.
-- Note: Print NULL when there are no more names corresponding to an occupation.
-- Exlaination 
-- The first column is an alphabetically ordered list of Doctor names.
-- The second column is an alphabetically ordered list of Professor names.
-- The third column is an alphabetically ordered list of Singer names.
-- The fourth column is an alphabetically ordered list of Actor names.
-- The empty cell data for columns with less than the maximum number of names per occupation
