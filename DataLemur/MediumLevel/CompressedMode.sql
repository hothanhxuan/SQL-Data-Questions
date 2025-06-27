WITH tb2 AS
(
SELECT 
      order_occurrences AS mode_value
FROM items_per_order
GROUP BY order_occurrences
ORDER BY COUNT(*) DESC
LIMIT 1

)
SELECT 
      tb1.item_count AS mode
FROM tb2
LEFT JOIN items_per_order AS tb1
ON tb2.mode_value = tb1.order_occurrences




-- Write a query to retrieve the mode of the order occurrences. 
-- if there are multiple item counts with the same mode -> sorted in ascending order.
