SELECT  
      sender_id --dim 
      ,COUNT(message_id) AS message_count --meassure 
FROM messages
WHERE DATE_PART('month', sent_date::date) = 08 AND
      DATE_PART('year', sent_date::date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. 
-- Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.
