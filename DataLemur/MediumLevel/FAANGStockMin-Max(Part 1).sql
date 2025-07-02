WITH h AS
(
SELECT 
      ticker
      ,TO_CHAR(date, 'Mon-YYYY') AS max_mth
      ,MAX(open) AS high
      ,DENSE_RANK() OVER (PARTITION BY ticker ORDER BY open DESC) AS rank1
FROM stock_prices
GROUP BY ticker, open, date
ORDER BY ticker
)
,
l AS
(
SELECT
      ticker
      ,TO_CHAR(date, 'Mon-YYYY') AS min_mth
      ,MIN(open) AS low 
      ,DENSE_RANK() OVER (PARTITION BY ticker ORDER BY open) AS rank2
FROM stock_prices
GROUP BY ticker, open, date
ORDER BY ticker
)
SELECT 
      h.ticker
      ,h.max_mth AS highest_mth
      ,h.high AS highest_open
      ,l.min_mth AS lowest_mth
      ,l.low AS lowest_open
FROM h 
LEFT JOIN l
ON h.ticker = l.ticker 
WHERE h.rank1 = 1
  AND l.rank2 = 1
ORDER BY h.ticker


-- the highest and lowest open prices for each FAANG stock by month over the years.

-- For each FAANG stock, display the ticker symbol, 
-- the month and year ('Mon-YYYY') with the corresponding highest 
-- and lowest open prices (refer to the Example Output format). 
-- Ensure that the results are sorted by ticker symbol.

