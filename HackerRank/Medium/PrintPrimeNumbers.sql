SELECT GROUP_CONCAT(prime ORDER BY prime SEPARATOR '&') AS primes
FROM (
    SELECT n AS prime
    FROM ( -- Sinh số từ 1 → 1000.
        SELECT a.N + b.N*10 + c.N*100 + 1 AS n
        FROM 
            (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 
             UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL 
             SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
            (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 
             UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL 
             SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
            (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 
             UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL 
             SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
        WHERE (a.N + b.N*10 + c.N*100 + 1) <= 1000
    ) AS Numbers
    WHERE n > 1 -- Loại bỏ số nhỏ hơn 2 vì số nguyên tố bắt đầu từ 2 
      AND NOT EXISTS ( -- Kiểm tra điều kiện nguyên tố 
        SELECT 1 
        FROM ( -- Vì √1000 ≈ 31.6, chỉ cần chia đến 31 là đủ để test primality
            SELECT 2 AS d UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 
            UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
            UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13
            UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17
            UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20 UNION ALL SELECT 21
            UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
            UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29
            UNION ALL SELECT 30 UNION ALL SELECT 31
        ) Divisors
        WHERE Numbers.n % Divisors.d = 0 -- n chia hết cho d,  
          AND Divisors.d <= FLOOR(SQRT(Numbers.n)) -- Giữ lại số nào không chia hết bởi divisor ≤ √n.
    )
) t;



-- Write a query to print all prime numbers less than or equal to . 
-- Print your result on a single line, and use the ampersand () character as your separator (instead of a space).
-- For example, the output for all prime numbers  would be: 2&3&5&7
