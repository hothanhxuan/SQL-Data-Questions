WITH tb1 AS
(
SELECT
      user_id
      ,activity_type
      ,CASE WHEN activity_type = 'send' THEN SUM(time_spent) 
            WHEN activity_type = 'open' THEN SUM(time_spent) 
            END AS sum_time_spent
FROM (SELECT 
            user_id
            ,activity_type
            ,time_spent
      FROM activities
      WHERE activity_type IN ('open','send')
      ORDER BY user_id) AS define_activity_type
GROUP BY user_id, activity_type
ORDER BY user_id
)
,
sending AS
(
SELECT
      user_id
      ,activity_type 
      ,sum_time_spent AS time_spent_sending
FROM tb1
WHERE activity_type = 'send'
)
,
opening AS
(
SELECT
      user_id
      ,activity_type 
      ,sum_time_spent AS time_spent_opening 
FROM tb1
WHERE activity_type = 'open'
)
,
tb2 AS
(
SELECT 
      s.user_id
      ,s.time_spent_sending
      ,o.time_spent_opening
FROM sending AS s 
LEFT JOIN opening AS o 
ON s.user_id = o.user_id
)

SELECT  
      a.age_bucket
      ,ROUND(tb2.time_spent_sending / (tb2.time_spent_sending + tb2.time_spent_opening) * 100.0, 2) AS send_perc
      ,ROUND(tb2.time_spent_opening / (tb2.time_spent_sending + tb2.time_spent_opening) * 100.0, 2) AS open_perc
FROM age_breakdown AS a 
LEFT JOIN tb2
ON a.user_id = tb2.user_id
ORDER BY a.age_bucket;
      

-- obtain a breakdown of the time spent sending vs. opening snaps 
-- as a percentage of total time spent on these activities grouped by age group.
-- Round the percentage to 2 decimal places in the output.

-- Notes:
-- Calculate the following percentages:
-- time spent sending / (Time spent sending + Time spent opening)
-- Time spent opening / (Time spent sending + Time spent opening)
-- To avoid integer division in percentages, multiply by 100.0 and not 100.
