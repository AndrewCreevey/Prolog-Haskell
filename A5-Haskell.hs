-- ------ 159.202 - Assignment 4 ------
-- ID: 12236284, Name: Andrew Creevey -
-- ID: 14089365, Name: Jonny Jackson --
-- -------- All parts solved  ---------

import DVDdata

-------------------------------------------------------------------------------------------------

{----- Exercise 1 -----}

-- a)
-- This splits an integer into single digits and puts them in a list
-- e.g. split 321 would return [3,2,1]
split :: Int -> [Int]
split 0 = []
split x = split (div x 10) ++ [rem x 10]

-- I have assumed that n is not a negative number as described in brief
hasD:: Int -> Int -> Bool
hasD n d
    | (d < 0 || d > 9) = error "d must be between 0 - 9"
    | n == 0 = False                                               -- base case
    | div n (10 ^ ((length (split n)) - 1)) == d = True            
    | otherwise = hasD (mod n (10 ^ ((length (split n)) - 1)))  d

hasD1 x n
    | mod x 10 == n = True
    | x == 0 = False
    | otherwise = hasD1 (div x 10) n
    
-- b)

-- check if the digit y is contained in the list
checkDigits :: [Int] -> Int -> Int
checkDigits [] y = 0
checkDigits list y
    | head list == y = 1
    | otherwise = checkDigits (tail list) y

-- in the count function first we split the head into single variables 
-- e.g. if the head of the list was 321, it would return [3,2,1], we then traverse this list 
-- searching for the variable a. If a is found it will return 1 and add the variable
count :: [Int] -> Int -> Int
count [] a = 0
count intL a 
    | (checkDigits (split (head intL)) a) == 1 = 1 + (count (tail intL) a) 
    | otherwise = count (tail intL) a

-- c)

countC :: [Int] -> Int -> Int
countC intL a = sum [checkDigits (split y) a | y <- intL]

-------------------------------------------------------------------------------------------------

{----- Exercise 2 -----}

-- a)
takeOut :: Int -> [Int] -> [Int]
takeOut m [] = []                                  -- base case
takeOut m xs
    | (rem (head xs) m == 0) = takeOut m (tail xs) -- if head is divisible by m, remove from list
    | otherwise = (head xs) : takeOut m (tail xs)  -- otherwise, keep it in the list

-- b) list comprehension version of above function
takeOutB :: Int -> [Int] -> [Int]
takeOutB m xs = [x | x <- xs, (rem x m /= 0)] -- remove anything that satisfies the condition

-- c) 

checkTuple (a,b,c) 
    | a + b == c = 1 -- returns 1 if a+b=c
    | otherwise = 0  -- else return 0

--assume correct input of tuple
type Tuple = (Int,Int,Int)

count3R :: [Tuple] -> Int
count3R [] = 0                      -- base case 
count3R list
    | checkTuple (head list) == 1 = 1 + (count3R (tail list)) -- if a+b=c, then add to counter
    | otherwise = count3R (tail list)                         -- otherwise just call again

-- d) if a+b=c then add 1 to the sum
count3L intL = sum [checkTuple x | x <- intL]


count3G intL = length [(a,b,c) | (a,b,c) <- intL, (a+b)==c]

-------------------------------------------------------------------------------------------------

{----- Exercise 3 -----}

-- returns corresponding value from tuple
first  (a,_,_,_) = a
second (_,a,_,_) = a
third  (_,_,a,_) = a
fourth (_,_,_,a) = a

printAll [] = return []
printAll (x:xs) = do
    -- pretty print the information with correct spacing
    putStr((first x) ++ "   " ++ (second x) ++ "       " ++ (third x) ++ "              ") 
    -- example on stream used $ and .0 however no need to change it to a float
    if (5 * (fourth x)) /= 0 then putStrLn("$" ++ show(5 * (fourth x)) ++ ".0")
    else putStrLn(" ")
    printAll xs -- after printing 4th value, recall for next DVD

-- A counter for how many DVDs are stocked
-- We have assumed correct input of Availability
instances:: [(String, String, String, Integer)] -> Integer
instances [] = 0
instances (x:xs)
    | (third x) == "YES" = 1 + (instances xs) -- if third string == "YES", add 1 to count
    | otherwise = instances xs                -- if not, recall function

qSort [] = []
qSort (x:xs) = 
--  sorts and concatenates the following strings [smaller than x] < [x] <= [bigger than x]
    qSort [y | y <- xs, (second y) < (second x)] ++ [x] ++ 
    qSort [y | y <- xs, (second y) >= (second x)]

printTable list = do  
    putStrLn "                                                        "
    putStrLn "==$&$&$&   Welcome to the DVD Hoopy Doo Shop!   $&$&$&=="
    putStrLn "                                                        "
    putStrLn "DVD ID        Title           Available          Payment"
    putStrLn "                                                        "
    printAll (qSort list)
    putStrLn("                                                        ")
    putStrLn("           DVDs in stock:  " ++ show(instances list))
