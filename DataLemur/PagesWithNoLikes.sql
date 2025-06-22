SELECT tb1.page_id 
FROM pages AS tb1 
LEFT JOIN page_likes AS tb2 
ON tb1.page_id = tb2.page_id 
WHERE tb2.liked_date IS NULL 
ORDER BY tb1.page_id;  

-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page"). 
-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.
