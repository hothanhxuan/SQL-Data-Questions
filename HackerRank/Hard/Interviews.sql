SELECT cs.contest_id 
        , cs.hacker_id 
        , cs.name
        , SUM(ss.total_submissions) 
        , SUM(ss.total_accepted_submissions)
        , SUM(vs.total_views) 
        , SUM(vs.total_unique_views)
FROM Contests cs
JOIN Colleges cg 
    ON cs.contest_id = cg.contest_id
JOIN Challenges ch 
    ON cg.college_id = ch.college_id
LEFT JOIN ( 
            SELECT challenge_id 
                    , SUM(total_views) AS total_views 
                    , SUM(total_unique_views) AS total_unique_views 
            FROM View_Stats GROUP BY challenge_id 
            ) vs 
    ON ch.challenge_id = vs.challenge_id
LEFT JOIN ( 
            SELECT challenge_id 
                    , SUM(total_submissions) AS total_submissions 
                    , SUM(total_accepted_submissions) AS total_accepted_submissions 
            FROM Submission_Stats GROUP BY challenge_id ) ss 
    ON ch.challenge_id = ss.challenge_id
GROUP BY cs.contest_id , cs.hacker_id , cs.name
HAVING SUM(ss.total_submissions) + 
        SUM(ss.total_accepted_submissions) +
        SUM(vs.total_views) + 
        SUM(vs.total_unique_views) > 0
ORDER BY cs.contest_id;

-- Samantha interviews many candidates from different colleges using coding challenges and contests. 
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, 
-- total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .
-- Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.

-- Sample Output:
-- 66406 17973 Rose 111 39 156 56
-- 66556 79153 Angela 0 0 11 10
-- 94828 80275 Frank 150 38 41 15

