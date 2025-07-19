-- CÁCH 1, dành cho số frequency (num_users) bé <=10 -> DÙNG UNION ALL
WITH expanded AS
( 
  SELECT 
        searches
  FROM search_frequency 
  WHERE num_users >= 1

  UNION ALL

  SELECT 
        searches
  FROM search_frequency 
  WHERE num_users >= 2

  UNION ALL
  SELECT 
        searches
  FROM search_frequency 
  WHERE num_users >= 3
)
,
ordered AS 
(
  SELECT 
        searches
        ,ROW_NUMBER() OVER (ORDER BY searches) AS ranking 
        ,COUNT(*) OVER () AS total_row
  FROM expanded
)
SELECT 
      ROUND(AVG(searches),1) AS median
FROM ordered 
WHERE ranking IN ((total_row + 1) / 2, (total_row + 2) / 2);

-- CÁCH 2: dành cho số frequency (num_users) lớn, ko làm thủ công UNION ALL được thì dùng hàm 
-- nâng cao là generate_series(1, frequency) 
-- Là hàm tạo ra một dãy số từ 1 đến frequency (ví dụ: nếu frequency = 3 → sinh ra 1, 2, 3).
-- SELECT customer_id
-- FROM sales
-- JOIN generate_series(1, frequency) AS g(i) ON TRUE;
-- g(i) là gán bí danh:
-- g là tên bảng tạm
-- i là cột chứa các giá trị từ generate_series

SELECT 
      ROUND(AVG(searches),1) AS median
FROM (SELECT 
        searches
        ,ROW_NUMBER() OVER (ORDER BY searches) AS ranking 
        ,COUNT(*) OVER () AS total_row
      FROM (SELECT searches 
            FROM search_frequency
            JOIN generate_series(1, num_users) AS g(i) ON TRUE) AS expanded 
      ) AS ordered 
WHERE ranking IN ((total_row + 1) / 2, (total_row + 2) / 2);

-- ĐỀ BÀI:
-- Google's marketing team is making a Superbowl commercial and needs a simple statistic to put on their TV ad: the median number of searches a person made last year.
-- However, at Google scale, querying the 2 trillion searches is too costly. 
-- Luckily, you have access to the summary table which tells you the number of searches made last year and how many Google users fall into that bucket.
-- Write a query to report the median of searches made by a user. Round the median to one decimal point.
