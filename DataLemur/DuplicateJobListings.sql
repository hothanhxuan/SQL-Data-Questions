SELECT 
    COUNT(cnt_post) AS duplicate_companies
FROM (SELECT 
            company_id
            ,COUNT(title) AS cnt_post
      FROM job_listings
      GROUP BY company_id, title
      HAVING COUNT(title) > 1
      ORDER BY company_id) AS count;

-- Assume you're given a table containing job postings from various companies on the LinkedIn platform. 
-- Write a query to retrieve the count of companies that have posted duplicate job listings.

-- Definition:

-- Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.
