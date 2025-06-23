WITH m AS (
SELECT 
    product_id
    ,EXTRACT(MONTH FROM submit_date) AS month 
    ,stars
FROM reviews
GROUP BY product_id, submit_date, stars
ORDER BY month
)
SELECT 
      m.month 
      ,m.product_id
      ,ROUND(AVG(m.stars),2) AS average
FROM m 
GROUP BY m.product_id, m.month 
ORDER BY m.month, m.product_id;

-- Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
-- The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. 
-- Sort the output first by month and then by product ID.
