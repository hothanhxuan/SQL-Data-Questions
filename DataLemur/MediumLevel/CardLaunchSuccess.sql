WITH tb1 AS
(
SELECT *
      ,MAKE_DATE(issue_year, issue_month, 1) AS issue_date
      ,MIN(MAKE_DATE(issue_year, issue_month, 1)) OVER(
                        PARTITION BY card_name) AS launch_date
FROM monthly_cards_issued
)
SELECT 
      card_name
      ,issued_amount
FROM tb1
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;


-- to create a combination of the year and month using the MAKE_DATE(), use 1 as the first day of the month.

-- how many cards JPMorgan Chase issue in the first month.
-- Write a query that outputs the name of the credit card, 
-- and how many cards were issued in its launch month.
-- Order the results starting from the biggest issued amount.
