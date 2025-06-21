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

-- Given a table of Facebook posts, for each user who posted at least twice in 2021, 
-- write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
-- Output the user and number of the days between each user's first and last post.
