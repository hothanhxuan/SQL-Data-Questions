WITH raw_data AS
(
SELECT 
      COALESCE (tb1.user_id, tb2.user_id) AS user_id
      ,tb1.status AS current_status 
      ,CASE WHEN tb2.paid IS NULL THEN 'not paid' ELSE 'paid' END AS Payment_on_Day_T
FROM advertiser AS tb1
FULL OUTER JOIN daily_pay AS tb2
ON tb1.user_id = tb2.user_id
)
SELECT 
      user_id,
      CASE WHEN payment_on_day_t = 'not paid' THEN 'CHURN'
          WHEN payment_on_day_t = 'paid' AND current_status IN ('NEW', 'EXISTING', 'RESURRECT') THEN 'EXISTING'
          WHEN payment_on_day_t = 'paid' AND current_status = 'CHURN' THEN 'RESURRECT'
          WHEN payment_on_day_t = 'paid' AND current_status IS NULL THEN 'NEW'
      END AS new_status 
FROM raw_data
ORDER BY user_id; 


-- COALESCE function to combine the user_id columns from both tables. 


-- You're provided with two tables: the advertiser table contains information about advertisers and their respective payment status, 
-- and the daily_pay table contains the current payment information for advertisers, and it only includes advertisers who have made payments.

-- Write a query to update the payment status of Facebook advertisers based on the information in the daily_pay table. 
-- The output should include the user ID and their current payment status, sorted by the user id.
      
-- The payment status of advertisers can be classified into the following categories:

-- New: Advertisers who are newly registered and have made their first payment.
-- Existing: Advertisers who have made payments in the past and have recently made a current payment.
-- Churn: Advertisers who have made payments in the past but have not made any recent payment.
-- Resurrect: Advertisers who have not made a recent payment but may have made a previous payment and have made a payment again recently.
-- Before proceeding with the question, it is important to understand the possible transitions in the advertiser's status based on the payment status.

-- The following table provides a summary of these transitions:
-- #	Current Status	Updated Status	Payment on Day T
-- 1	NEW	               EXISTING      	Paid
-- 2	NEW	               CHURN	      Not paid
-- 3	EXISTING	         EXISTING	      Paid
-- 4	EXISTING	         CHURN	      Not paid
-- 5	CHURN	               RESURRECT	Paid
-- 6	CHURN	               CHURN	      Not paid
-- 7	RESURRECT            EXISTING	      Paid
-- 8	RESURRECT	         CHURN	      Not paid
