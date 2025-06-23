SELECT 
      manufacturer
      ,('$' || ROUND(SUM(total_sales) / 1000000) || ' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) DESC, manufacturer;

-- cách 2: CONCAT('$', ROUND(SUM(total_sales) / 1000000), 'million') AS sale


-- calculate the total drug sales for each manufacturer, DESC 
-- Round the answer to the nearest million 
-- any duplicates, sort them alphabetically by the manufacturer name
