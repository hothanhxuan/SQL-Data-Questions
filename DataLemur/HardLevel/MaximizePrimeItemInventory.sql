WITH count_item_and_total_sqr AS
(
  SELECT 
        SUM(square_footage) FILTER (WHERE item_type = 'prime_eligible')AS total_sqr_prime
        ,COUNT(item_id) FILTER (WHERE item_type = 'prime_eligible') AS batch_prime_count 
        ,SUM(square_footage) FILTER (WHERE item_type = 'not_prime')AS total_sqr_non_prime
        ,COUNT(item_id) FILTER (WHERE item_type = 'not_prime') AS batch_non_prime_count 
  FROM inventory
)
,
max_prime_cnt AS
(
  SELECT
          FLOOR(500000/total_sqr_prime) *  total_sqr_prime AS prime_occupied_area -- warehouse area / total prime area 
          ,FLOOR(500000/total_sqr_prime) * batch_prime_count AS prime_item_count -- (warehouse area / total prime area)*Number of Prime Batches
  FROM count_item_and_total_sqr
)

SELECT 
      'prime_eligible' AS item_type 
      ,prime_item_count AS item_count
FROM max_prime_cnt 

UNION 

SELECT
      'not_prime' AS item_type  
      ,FLOOR((500000 - prime_occupied_area) / total_sqr_non_prime) * batch_non_prime_count AS item_count -- (total areas - remaining_space_for_non)  
FROM max_prime_cnt, count_item_and_total_sqr

ORDER BY item_count DESC;


-- Amazon wants to maximize the storage capacity of its 500,000 square-foot warehouse by prioritizing a specific batch of prime items. 
-- The specific prime product batch detailed in the inventory table must be maintained.

-- So, if the prime product batch specified in the item_category column included 1 laptop and 1 side table, that would be the base batch. 
-- We could not add another laptop without also adding a side table; they come all together as a batch set.

-- After prioritizing the maximum number of prime batches, any remaining square footage will be utilized to stock non-prime batches, 
-- which also come in batch sets and cannot be separated into individual items.

-- Write a query to find the maximum number of prime and non-prime batches that can be stored in the 500,000 square feet warehouse based on the following criteria:
-- Prioritize stocking prime batches
-- After accommodating prime items, allocate any remaining space to non-prime batches
-- Output the item_type with prime_eligible first followed by not_prime, along with the maximum number of batches that can be stocked.

-- Assumptions:

-- Again, products must be stocked in batches, so we want to find the largest available quantity of prime batches, and then the largest available quantity of non-prime batches
-- Non-prime items must always be available in stock to meet customer demand, so the non-prime item count should never be zero.
-- Item count should be whole numbers (integers).
