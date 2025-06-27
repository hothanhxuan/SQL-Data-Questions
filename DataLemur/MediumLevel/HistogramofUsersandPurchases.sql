WITH tb1 AS
(
SELECT 
      user_id
      ,product_id
      ,transaction_date
      ,MAX(transaction_date) OVER(PARTITION BY user_id) AS recent_date
FROM user_transactions 
)
SELECT 
      recent_date AS transaction_date
      ,user_id
      ,COUNT(product_id) AS purchase_count
FROM tb1
WHERE recent_date = transaction_date
GROUP BY user_id, recent_date
ORDER BY transaction_date



-- write a query that retrieve the users along with the number of products they bought.

-- Output the user's most recent transaction date, 
-- user ID, and the number of products, 
-- sorted in chronological order by the transaction date.

-- most recent transaction date >> max(transaction_date)
-- the number of products >> sum(count(product_id))
