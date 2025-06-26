-- A phone call is considered an international call 
-- when the person calling is in a different country than the person receiving the call.

-- What percentage of phone calls are international? Round the result to 1 decimal.

WITH raw_data AS 
(
SELECT 
      po.caller_id AS caller_caller_id
      ,po.country_id AS caller_country_id
      ,poo.caller_id AS receiver_caller_id 
      ,poo.country_id AS receiver_country_id
FROM phone_calls AS pc
LEFT JOIN phone_info AS po
ON pc.caller_id = po.caller_id
LEFT JOIN phone_info AS poo
ON pc.receiver_id = poo.caller_id
WHERE po.country_id <> poo.country_id
)
SELECT
      ROUND(
      100.0 * COUNT(*) / (SELECT COUNT(*) FROM phone_calls) 
      ,1) AS international_calls_pct
FROM raw_data

