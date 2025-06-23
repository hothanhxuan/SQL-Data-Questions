SELECT 
      drug
      ,(total_sales - cogs) AS total_profit
FROM pharmacy_sales
GROUP BY drug, total_sales, cogs
ORDER BY total_profit DESC
LIMIT 3;


-- the top 3 most profitable drugs sold, 
-- >> Total Profit = Total Sales - Cost of Goods Sold
-- and how much profit they made. 
