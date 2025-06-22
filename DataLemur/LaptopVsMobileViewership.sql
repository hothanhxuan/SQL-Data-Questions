SELECT 
      laptop_views
     ,SUM(cnt_mobile) AS mobile_views
FROM
    (SELECT 
          device_type
         ,COUNT(view_time) AS laptop_views
    FROM viewership
    WHERE device_type = 'laptop'
    GROUP BY device_type) AS a
    ,
    (SELECT 
          device_type
         ,COUNT(view_time) AS cnt_mobile
    FROM viewership
    WHERE device_type IN ('tablet','phone')
    GROUP BY device_type) AS b
GROUP BY laptop_views;

-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.

-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. 
-- Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
