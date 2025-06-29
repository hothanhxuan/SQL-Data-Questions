SELECT
      DISTINCT T1.user_id
FROM transactions AS T1
INNER JOIN transactions AS T2
ON DATE(T1.transaction_date) = DATE(T2.transaction_date) + 1
INNER JOIN transactions AS T3
ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
ORDER BY T1.user_id;



-- In an effort to identify high-value customers, 
-- Amazon asked for your help to obtain data about users 
-- who go on shopping sprees. 
-- A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

-- List the user IDs who have gone on at least 1 shopping spree in ascending order.
