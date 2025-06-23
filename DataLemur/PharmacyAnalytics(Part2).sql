SELECT 
       manufacturer
      ,COUNT(drug) AS drug_count
      ,ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <=0
GROUP BY manufacturer
ORDER BY total_loss DESC;


-- the manufacturers associated with the drugs 
-- that resulted in losses for CVS Health 
-- and calculate the total amount of losses incurred.

-- output: manufacturer's name,  
--         number of drugs associated with losses
--         total losses in absolute value (DESC)
-- loss = total_sales - cogs = giá trị âm (<=0) 
