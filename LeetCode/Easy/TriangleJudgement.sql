SELECT x, y, z,
  CASE
    WHEN x + y > z AND y + z > x AND x + z > y
    THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;
  

-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.

-- Input: 
-- Triangle table:
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+
-- Output: 
-- +----+----+----+----------+
-- | x  | y  | z  | triangle |
-- +----+----+----+----------+
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |
-- +----+----+----+----------+
