WITH count_orders AS
(
SELECT 
    DISTINCT(t.user_id)
    ,COUNT(t.order_id) AS num_orders
    ,u.city
FROM trades AS t
LEFT JOIN users AS u
on t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY t.user_id, u.city
ORDER BY num_orders DESC
) 
SELECT
    city
    ,SUM(num_orders) AS total_orders
FROM count_orders
GROUP BY city 
ORDER BY total_orders DESC
LIMIT 3;

-- Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.

-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
-- Output the city name and the corresponding number of completed trade orders.
