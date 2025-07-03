SELECT
      CASE 
          WHEN order_id % 2 <> 0 AND (SELECT COUNT(order_id) AS cnt_total FROM orders) <> order_id
            THEN order_id + 1 -- lẻ thành chẵn
          WHEN order_id % 2 = 0 AND (SELECT COUNT(order_id) AS cnt_total FROM orders) <> order_id
            THEN order_id - 1 -- chẵn thành lẻ
          ELSE order_id
          END AS corrected_order_id
      ,item
FROM orders
ORDER BY corrected_order_id

-- Zomato encountered an issue with their delivery system. 
-- Due to an error in the delivery driver instructions, each item's order was swapped with the item in the subsequent row. 
-- As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.

-- If the last item has an odd order ID, it should remain as the last item in the corrected data. 
-- For example, if the last item is Order ID 7 Tandoori Chicken, 
-- then it should remain as Order ID 7 in the corrected data.

-- In the results, return the correct pairs of order IDs and items.

