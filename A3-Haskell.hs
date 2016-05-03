-- ------ 159.202 - Assignment 1 ------
-- ID: 12236284, Name: Andrew Creevey -
-- ID: 12194358, Name: Jordan Smith ---
-- -------- All parts solved  ---------

---------------------------------------------------------------------------------------------------

{----- Exercise 1 -----}

-- a) 
-- 3^234    -- Input
-- 59702569 -- Output

-- b) 
-- factorial 600  -- Input
-- 1409           -- Output
factorial :: Integer -> Integer
factorial n = product [1..n]

-- c) 
-- (rem 5 8 - div 13 4, "FUN" ++ "THOMAS", 1 + div 5 7 == div 12 7) -- Input
-- (2, "FUNTHOMAS", True)                                           -- Output

-- d) 
-- chr 100 -- Input
-- 'd'     -- Output

-- ord 'Q' -- Input
-- 81      -- Output

---------------------------------------------------------------------------------------------------

{----- Exercise 2 -----}

-- a) Design a function to compute the sum
sum2a :: Float -> Float
sum2a n = ((n*(n+1)/2)^2)

-- b) Guards and recursion
sum2b :: Integer -> Integer
sum2b n
   | n == 0 = 0 
   | otherwise = (n^3) + sum2b (n-1) -- Recursice call

-- c) Patterns and recursion
sum2c :: Integer -> Integer
sum2c 0 = 0
sum2c n = (n^3) + sum2c (n-1) -- Recursive call

-- d) Which of the above solutions is the most run-time efficient
-- Sum2a is the most run time efficient because it does not use recursion and will
-- only loop once. The function does not need recursion to get the answer, therefore
-- it is the most efficient.

---------------------------------------------------------------------------------------------------

{----- Exercise 3 -----}

-- a) Write a function that converts hexadecimal to its decimal value.
f :: Char -> Integer
f ch
    | ch == '0' = 0
    | ch == '1' = 1
    | ch == '2' = 2
    | ch == '3' = 3
    | ch == '4' = 4
    | ch == '5' = 5
    | ch == '6' = 6
    | ch == '7' = 7
    | ch == '8' = 8
    | ch == '9' = 9
    | ch == 'A' = 10
    | ch == 'B' = 11
    | ch == 'C' = 12
    | ch == 'D' = 13
    | ch == 'E' = 14
    | ch == 'F' = 15
    | ch == 'a' = 10
    | ch == 'b' = 11
    | ch == 'c' = 12
    | ch == 'd' = 13
    | ch == 'e' = 14
    | ch == 'f' = 15
    | otherwise = error("Incorrect value was entered") -- Exception handler

-- b) Compute the income of a person in NZ after deducting the income tax
netEarning :: Float -> Float 
netEarning income = 
    if (income > 0 && income <= 14000)           -- If income is between 0-14000
    then income * 0.895                          -- Remove 10.5%
    
    else if (income > 14000 && income <= 48000)  -- If income is between 14000-48000
    then (income-14000) * 0.825 + 12530          -- Remove 17.5% and add on the amount from above value
    
    else if (income > 48000 && income <= 70000)  -- If income is between 48000-70000
    then (income - 48000) * 0.7 + 40580          -- Remove 30% and add on the amount from above value
    
    else if (income > 70000)                     -- If income is 70000+
    then (income - 70000) * 0.67 + 55980         -- Remove 33% and add on the amount from above value
    
    else error ("That income is invalid")        -- Else, incase of incorrect input, display error

---------------------------------------------------------------------------------------------------

{----- Exercise 4 -----}

-- a) Compute gcd of 2 positive integers using dijkstar's algorithm
gcdD :: Integer -> Integer -> Integer
gcdD x y
    | x == y = x               -- If x and y are the same, return x
    | x > y = gcdD (x-y) y     -- If x is greater than y recall function
    | otherwise = gcdD x (y-x) -- Else statement

-- b) Recursive program to calculate k-th power of n
pow :: Integer -> Integer -> Integer
pow n k
    | n == 0 = 0 -- base case
    | k == 0 = 0 -- base case
    | (rem k 2) == 0 = ((n * n) ^ (div k 2)) -- if even number do zis
    | otherwise = n * (n ^ (k - 1))          -- otherwise if odd, do zis





