WITH tb1 AS -- tính total spend theo từng product
(
SELECT  
      category 
      ,product
			,SUM(spend) AS total_spend
FROM product_spend
WHERE EXTRACT(year from transaction_date) = 2022
GROUP BY product, category
ORDER BY category
)
,
tb2 AS -- xếp hạng total_spend nhóm theo category từ cao xuống thấp
(
SELECT
      category
      ,product
      ,total_spend
      ,dense_rank() OVER (
        PARTITION BY category ORDER BY total_spend DESC) AS rank
FROM tb1
)

SELECT 
      category
      ,product
      ,total_spend
FROM tb2
WHERE rank <=2;


-- identify the top two highest-grossing products 
-- within each category in the year 2022
-- The output should include the category, product, and total spend.
