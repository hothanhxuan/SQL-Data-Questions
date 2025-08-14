SELECT DISTINCT f1.X AS X1, f1.Y AS Y1 
FROM functions f1 
JOIN functions f2 
ON f1.X = f2.Y -- CẶP (X1, Y2) 
    AND f1.Y = f2.X -- CẶP (X2, Y1)
WHERE f1.X <= f1.Y  -- Cặp dạng (a,b) và (b,a) với a ≠ b 
GROUP BY f1.X, f1.Y 
HAVING (COUNT(X1)>1 and f1.X = f1.Y) or (f1.X <> f1.Y) -- Cặp dạng (a,a) -> Để in ra (a,a) thì bảng phải có ít nhất 2 bản ghi (a,a) 
    -- nếu chỉ có 1 hàng (a,a) thì không được coi là “symmetric pair” 
ORDER BY f1.X;

-- You are given a table, Functions, containing two columns: X and Y.
-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
