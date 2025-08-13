SELECT DISTINCT f1.x AS x1, f1.y AS y1 
FROM functions f1 
JOIN functions f2 
ON f1.x = f2.y 
    AND f1.y = f2.x 
WHERE f1.x <= f1.y 
group by f1.x,f1.y 
having (count(x1)>1 and f1.x=f1.y) or (f1.x<>f1.y) 
ORDER BY f1.x

-- You are given a table, Functions, containing two columns: X and Y.
-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
