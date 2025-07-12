SELECT
      year
      ,product_id
      ,curr_year_spend 
      ,prev_year_spend
      ,ROUND((curr_year_spend - prev_year_spend) / prev_year_spend * 100.0 ,2) AS yoy_rate 
FROM 
    (SELECT 
      EXTRACT(YEAR FROM transaction_date) AS year
      ,product_id
      ,spend AS curr_year_spend 
      ,Lag(spend) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend
    FROM user_transactions) AS calculation; 


-- Assume you're given a table containing information about Wayfair user transactions for different products. 
-- Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

-- The output should include the year in ascending order, product ID, current year's spend, previous year's spend and year-on-year growth percentage, rounded to 2 decimal places.
