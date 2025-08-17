SELECT HC.hacker_id, HC.name, HC.cnt
FROM (
    SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS cnt
    FROM Hackers AS H
    LEFT JOIN Challenges AS C
        ON H.hacker_id = C.hacker_id
    GROUP BY H.hacker_id, H.name
) AS HC
JOIN (
    SELECT cnt, COUNT(*) AS cnt_count
    FROM (
        SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS cnt
        FROM Hackers AS H
        LEFT JOIN Challenges AS C
            ON H.hacker_id = C.hacker_id
        GROUP BY H.hacker_id, H.name
    ) AS T
    GROUP BY cnt
) AS CG
ON HC.cnt = CG.cnt
WHERE 
    CG.cnt_count = 1
    OR HC.cnt = (SELECT MAX(cnt)
                 FROM (
                     SELECT COUNT(C.challenge_id) AS cnt
                     FROM Hackers AS H
                     LEFT JOIN Challenges AS C
                         ON H.hacker_id = C.hacker_id
                     GROUP BY H.hacker_id, H.name
                 ) AS M)
ORDER BY HC.cnt DESC, HC.hacker_id;

-- Julia asked her students to create some coding challenges. 
-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. 
-- If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, 
-- then exclude those students from the result.
