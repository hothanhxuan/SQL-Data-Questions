SELECT name, bonus
FROM 
    (SELECT E.empId, E.name, E.supervisor, E.salary, B.bonus
    FROM Employee as E
    LEFT JOIN Bonus as B
        ON E.empId = B.empId) as full_table
WHERE bonus < 1000 OR bonus IS NULL;

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
-- Return the result table in any order.

-- Input: 
-- Employee table:
-- +-------+--------+------------+--------+
-- | empId | name   | supervisor | salary |
-- +-------+--------+------------+--------+
-- | 3     | Brad   | null       | 4000   |
-- | 1     | John   | 3          | 1000   |
-- | 2     | Dan    | 3          | 2000   |
-- | 4     | Thomas | 3          | 4000   |
-- +-------+--------+------------+--------+
-- Bonus table:
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- Output: 
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+
