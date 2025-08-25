SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS cnt
    FROM Hackers AS H
    LEFT JOIN Challenges AS C
        ON H.hacker_id = C.hacker_id
    GROUP BY H.hacker_id, H.name




-- Samantha interviews many candidates from different colleges using coding challenges and contests. 
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, 
-- total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .
-- Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

