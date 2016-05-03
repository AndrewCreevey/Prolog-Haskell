-- ------ 159.202 - Assignment 4 ------
-- ID: 12236284, Name: Andrew Creevey -
-- -------- All parts solved  ---------

---------------------------------------------------------------------------------------------------

{----- Exercise 1 -----}
-- a) converts seconds into time (hours, minutes, seconds).
time :: Int -> (Int, Int, Int)
time (n) = (div n 3600, (mod (div n 60) 60), mod n 60)
-- divide n by 3600 to give hours, then remainder the hours by 60, and finally remainder 60 to get minutes

-- b) Test if point x,y is on the line (a,b,c)
-- goes from an (int,int) list to a tuple to a bool
onLine :: (Int, Int) -> (Int, Int, Int) -> Bool
onLine (x,y) (a,b,c) = (((a * x) + (b * y) + c) == 0)
-- uses the aX + bY + c = 0 function, if it == 0, then the point is on the line

---------------------------------------------------------------------------------------------------

{----- Exercise 2 -----}
-- a)
type Fraction = (Int ,Int)
powFr :: Fraction -> Int -> Fraction
powFr (x,y) a = ((div x d ^ a), (div y d ^ 3)) where d = gcd x y 
-- when tested with powFr (4,10) 3, it displays (8,125)

--If you wanted to display the answer with a / sign, you would need to have the following:
powFr1 :: Fraction -> Int -> String
powFr1 (x,y) a = (show (div x d ^ a)) ++ "/" ++ (show (div y d ^ a)) where d = gcd x y 
-- when tested with powFr1 (4,10) 3, it displays "8/125"

-- b)
-- Custom operator
(%%) :: Fraction -> Fraction -> Bool
(%%) (x, xs) (y, ys) = ((x == ys) && (xs == y)) -- returns true if variables are swapped
infix 3 %%

---------------------------------------------------------------------------------------------------

{----- Exercise 3 -----}
-- a) 
prod :: [Int] -> [Int] -> Int
prod [] [] = 1                             -- base case
prod [_] [] = error "Lists not equal size" -- if lists are unequal sizes [1,2] [1,2,3]
prod [] [_] = error "Lists not equal size" -- if lists are unequal sizes [1,2,3] [1,2]
prod (x:xs) (y:ys) 
    | (rem x y == 0) = x * prod (xs)(ys)  -- if x remainder y = 0 then multiply x and new call
	| otherwise = prod (xs)(ys)           -- otherwise re-call with tail

-- b)
magic nList = (minimum nList, removeItem(minimum nList) nList)
removeItem _ [] = [] -- base case
removeItem x (y:ys) 
    | x == y    = removeItem x ys     -- if x=y remove y from list by returning x tail
    | otherwise = y : removeItem x ys -- else x!=y so re-call

-- c)
total :: [[Int]] -> Int
total [] = 0 -- base case
total (head:tail) = sum(head) + total(tail) -- add the sum of the head list and re-call using tail

---------------------------------------------------------------------------------------------------

{----- Exercise 4 -----}
-- a)
sOdd1 :: [Int] -> [Int]    -- from integer list to integer list
sOdd1 [] = []              -- base case
sOdd1 (x:xs) = 
    if odd x then x + 1 : (sOdd1 xs)  -- if number is odd, store head+1 in list, then call tail
    else (sOdd1 xs)                   -- else if number is even, re-call with tail
 
-- b)
sOdd2 :: [Int] -> [Int]               -- from integer list to integer list
sOdd2 [] = []                         -- base case
sOdd2 (x:xs) 
    | (odd x) = x + 1 : (sOdd2 xs)    -- if odd, then store head+1 in list, re-call with tail
    | otherwise = (sOdd2 xs)          -- otherwise re-call with tail

sOdd3 :: [Int] -> [Int] 
sOdd3 xs = [x + 1 | x <- xs, odd x]   -- remove from the list unless number is odd. add 1 to number if odd
