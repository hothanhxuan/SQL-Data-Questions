SELECT
      tweets_num AS tweets_bucket
      ,COUNT(user_id) AS user_num
FROM (
        SELECT 
            user_id
            ,COUNT(tweet_id) AS tweets_num
        FROM tweets
        WHERE (EXTRACT(YEAR FROM tweet_date))=2022
        GROUP BY user_id) AS total_tweets
GROUP BY tweets_num; 

-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.
