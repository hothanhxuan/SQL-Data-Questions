SELECT 
      user_id
      ,spend
      ,transaction_date
FROM 
    (
    SELECT 
      user_id
      ,spend
      ,transaction_date
      ,ROW_NUMBER() OVER (
      PARTITION BY user_id ORDER BY transaction_date) AS row_num
    FROM transactions
    ) AS rank
WHERE row_num = 3;

-- the third transaction of every user.
-- output: user id, spend, transaction_date
