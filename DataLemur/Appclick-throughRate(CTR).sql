-- WITH c AS
-- (
-- SELECT
--       app_id
--       ,COUNT(event_type) AS cnt_click
--       ,EXTRACT (YEAR FROM timestamp) AS year 
-- FROM events
-- WHERE event_type = 'click'
-- GROUP BY app_id, year
-- HAVING EXTRACT (YEAR FROM timestamp) = 2022
-- )
-- , i AS
-- (
-- SELECT
--       app_id
--       ,COUNT(event_type) AS cnt_impression
--       ,EXTRACT (YEAR FROM timestamp) AS year 
-- FROM events
-- WHERE event_type = 'impression'
-- GROUP BY app_id, year
-- HAVING EXTRACT (YEAR FROM timestamp) = 2022
-- )
-- SELECT
--       c.app_id
--       ,ROUND(100.0 * (SUM(cnt_click) / SUM(cnt_impression)),2) AS CTR
-- FROM c,i 
-- GROUP BY c.app_id
-- ORDER BY c.app_id DESC;

SELECT
  app_id,
  ROUND(100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2) as ctr
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id;

-- Assume you have an events table on Facebook app analytics. 
-- Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

-- Definition and note:

-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100.
