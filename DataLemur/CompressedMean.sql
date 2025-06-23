SELECT 
     ROUND(
          CAST((total_items / total_orders) as DECIMAL)
          ,1) AS mean
FROM
    (SELECT  
          SUM(order_occurrences) AS total_orders
          ,SUM(item_count*order_occurrences) AS total_items
    FROM items_per_order) AS calculate;

-- MEAN = Total items / Total orders
-- Total items = sum(count of items in each order*number of orders for each item count)
-- Total orders = sum(orders) = 4960
