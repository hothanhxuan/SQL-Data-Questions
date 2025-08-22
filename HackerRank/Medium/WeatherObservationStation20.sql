
  SELECT LAT_N AS val
  FROM STATION
  WHERE (
      SELECT COUNT(*) FROM STATION t2 WHERE t2.LAT_N < t1.LAT_N) 
     

A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
