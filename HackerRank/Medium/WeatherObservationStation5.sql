SELECT *
FROM (SELECT CITY, CHAR_LENGTH(CITY)
    FROM STATION
    WHERE CHAR_LENGTH(CITY) = (SELECT MIN(CHAR_LENGTH(CITY)) FROM STATION) 
    ORDER BY CITY ASC
    LIMIT 1) AS shortest

UNION ALL

SELECT *
FROM (SELECT CITY, CHAR_LENGTH(CITY)
    FROM STATION
    WHERE CHAR_LENGTH(CITY) = (SELECT MAX(CHAR_LENGTH(CITY)) FROM STATION)
    ORDER BY CITY ASC
    LIMIT 1) AS longest 
;

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
  
-- Sample Input
-- For example, CITY has four entries: DEF, ABC, PQRS and WXY.
  
-- Sample Output
-- ABC 3
-- PQRS 4
