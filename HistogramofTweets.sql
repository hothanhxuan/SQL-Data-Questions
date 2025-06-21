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
