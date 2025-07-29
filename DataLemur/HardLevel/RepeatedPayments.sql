WITH tb1 AS
(
  SELECT 
        merchant_id
        ,amount
        ,credit_card_id
        ,transaction_timestamp AS current_transaction
        ,lead(transaction_timestamp) OVER(
            PARTITION BY merchant_id, amount, credit_card_id 
            ORDER BY transaction_timestamp) AS after_transaction 
  FROM transactions
  ORDER BY merchant_id
)
,
tb2 AS
(
  SELECT 
        merchant_id
        ,amount
        ,credit_card_id
        ,ROUND(EXTRACT(EPOCH FROM (after_transaction - current_transaction)) / 60 , 0) as  minute_difference 
  FROM tb1
)
SELECT COUNT(merchant_id) AS payment_count
FROM  tb2 
WHERE minute_difference <= 10;

-- Sometimes, payment transactions are repeated by accident; it could be due to user error, API failure or a retry error that causes a credit card to be charged twice.
-- Using the transactions table, identify any payments made at the same merchant with the same credit card for the same amount within 10 minutes of each other. 
-- Count such repeated payments.

-- Assumptions:

-- The first transaction of such payments should not be counted as a repeated payment. 
-- This means, if there are two transactions performed by a merchant with the same credit card and for the same amount within 10 minutes, there will only be 1 repeated payment.
