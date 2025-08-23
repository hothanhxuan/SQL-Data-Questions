SELECT ROUND(AVG(val), 4) AS median_val
FROM (
  SELECT LAT_N AS val, @i := @i + 1 AS rn
  FROM STATION
  JOIN (SELECT @i := 0) AS sub
  WHERE LAT_N IS NOT NULL
  ORDER BY LAT_N
) AS ranked
JOIN (SELECT COUNT(*) AS cnt FROM STATION WHERE LAT_N IS NOT NULL) AS c
WHERE rn IN ((cnt + 1) DIV 2, (cnt + 2) DIV 2);
     

A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
