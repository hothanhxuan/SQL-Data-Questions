SELECT t.id, t.age, t.coins_needed, t.power
FROM (SELECT 
            W.id
            ,WP.age
            ,W.coins_needed
            ,W.power 
        FROM Wands_Property AS WP
        LEFT JOIN Wands AS W
        ON WP.code = W.code
        where is_evil = 0 
        GROUP BY WP.age, W.power, W.id, W.coins_needed) AS t

JOIN 

(SELECT age, MIN(coins_needed) AS min_coin, power
FROM (SELECT 
            W.id
            ,WP.age
            ,W.coins_needed
            ,W.power 
        FROM Wands_Property AS WP
        LEFT JOIN Wands AS W
        ON WP.code = W.code
        where is_evil = 0 
        GROUP BY WP.age, W.power, W.id, W.coins_needed) AS t
GROUP BY power, age
) AS m

ON t.age = m.age
AND t.power = m.power
AND t.coins_needed = m.min_coin
ORDER BY t.power DESC, t.age DESC; 


-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
-- If more than one wand has same power, sort the result in order of descending age.
