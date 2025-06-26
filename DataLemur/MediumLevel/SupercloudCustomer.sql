WITH tb1 AS
(
SELECT 
      DISTINCT(c.customer_id)
      ,c.product_id
      ,p.product_category
      ,p.product_name
FROM customer_contracts AS c
LEFT JOIN products AS p 
ON c.product_id = p.product_id
WHERE product_name LIKE 'A%'
ORDER BY c.customer_id
)
,
tb2 AS
(
SELECT 
      DISTINCT product_category
      ,customer_id
FROM tb1
ORDER BY customer_id
)
SELECT
      customer_id
FROM tb2
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- defined as a customer who has purchased at least one product of Azure 
-- from every product category of listed in the products table.

-- Write a query that identifies the customer IDs of these Supercloud customers.
