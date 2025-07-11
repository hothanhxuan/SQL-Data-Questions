SELECT 
      EXTRACT(MONTH FROM current.event_date) AS month 
      ,COUNT(DISTINCT current.user_id) AS monthly_active_users 
FROM user_actions AS current 
WHERE EXISTS 
            (
            SELECT 
                  last.user_id 
            FROM user_actions AS last 
            WHERE last.user_id = current.user_id 
              AND EXTRACT(MONTH FROM last.event_date) 
                  = EXTRACT(MONTH FROM current.event_date - interval '1 month')
            )
AND EXTRACT(MONTH FROM current.event_date) = 7
AND EXTRACT(YEAR FROM current.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM current.event_date);

-- Assume you're given a table containing information on Facebook user actions. 
-- Write a query to obtain number of monthly active users (MAUs) in July 2022, including the month in numerical format "1, 2, 3".

-- Hint:
-- An active user is defined as a user who has performed actions such as 'sign-in', 'like', or 'comment' in both the current month and the previous month.
