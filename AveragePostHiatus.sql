WITH tb1 AS 
(
SELECT
     user_id
    ,COUNT(post_id) 
FROM posts
WHERE DATE_PART('YEAR', post_date::date)=2021
GROUP BY user_id
HAVING COUNT(post_id) > 1
)
,
tb2 AS 
(
SELECT
      user_id
    ,(MAX(post_date::date) - MIN(post_date::date)) AS days_between
      FROM posts
GROUP BY user_id
ORDER BY user_id
)

SELECT 
      tb1.user_id
    ,days_between
FROM tb1
LEFT JOIN tb2 
ON tb2.user_id = tb1.user_id
WHERE days_between >0; 

