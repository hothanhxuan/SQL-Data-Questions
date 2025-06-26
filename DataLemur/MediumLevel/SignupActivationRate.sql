WITH tb1 AS
(
SELECT 
      email_id
      ,COUNT(signup_date) AS cnt_signup_date
FROM emails
GROUP BY email_id
)   
,
tb3 AS
(
SELECT 
      tb2.email_id
      ,tb1.cnt_signup_date
      ,tb2.signup_action 
FROM texts AS tb2
LEFT JOIN tb1 
ON tb2.email_id = tb1.email_id
)
,
tb4 AS
(
SELECT 
      COUNT(signup_action) AS cnt_confirmed
FROM tb3
WHERE signup_action = 'Confirmed'
)

SELECT 
      ROUND(tb4.cnt_confirmed  / SUM(tb3.cnt_signup_date), 2) AS confirm_rate
FROM tb3, tb4
GROUP BY tb4.cnt_confirmed;




-- find the activation rate >> sum(confirmed)/sum(signup_action)
-- Definitions:
-- emails table contain the information of user signup details.
-- texts table contains the users' activation information.

