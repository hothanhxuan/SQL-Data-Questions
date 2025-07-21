WITH raw_data AS
(
SELECT 
      tb1.user_id,
      tb1.status AS current_status,
      CASE WHEN tb2.paid IS NULL THEN 'not paid' ELSE 'paid' END AS Payment_on_Day_T 
FROM advertiser AS tb1
LEFT JOIN daily_pay AS tb2
ON tb1.user_id = tb2.user_id
)
SELECT 
      user_id,
      CASE WHEN payment_on_day_t = 'not paid' THEN 'CHURN'
           WHEN payment_on_day_t = 'paid' AND current_status IN ('NEW', 'EXISTING', 'RESURRECT') THEN 'EXISTING'
           WHEN payment_on_day_t = 'paid' AND current_status = 'CHURN' THEN 'RESURRECT' 
      END AS new_status 
FROM raw_data
ORDER BY user_id; 


-- COALESCE function to combine the user_id columns from both tables. 
