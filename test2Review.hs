-- Exam 1 Review 

{-
  - What is a first class function?
  A function that can take another function as an argument, and also return a function. 

  - What is functional programming? 

  - What is currying? 
  The act of breaking down a function into a series of functions, each taking only one parameter at a time.

  - types: 
  head :: [a] -> a
  take :: Int -> [b] -> [b]
  take 10 :: [a] -> [a]
  take 10 "geralt" :: [Char]
  fst (snd (1, ('a', "geralt))) ::
    snd => "('a', "geralt)
    fst => 'a'
  ==> Char

  - Evaluate functions: 
  head (tail "geralt")
    tail => "eralt"
    head => 'e'
  => 'e'

  "geralt" ++ " of " ++ "rivia" 
  => "geralt of rivia"

  (\x -> x + 1) 3
  => 4

  (\x y -> x + y) 3 4
  => 7

  - topics 
-}

-- allEven which returns true IFF all are even 
allEven :: [Int] -> Bool
allEven [] = True 
allEven (x:xs) = even x && allEven xs

-- 7: List Comprehension 
-- take a list of touples and return a list of the secodn elements of each tuple using list comprehension 
input1 = [(0,1), (0,2), (0,3), (0,4)]
secondElements xs = [y | (_, y) <- xs]

-- take in a list and return it's length using list comprehension 
listLength :: [a] -> Int 
listLength xs = sum [ 1 | x <- xs]

-- take in a list and return the even numbers squared 
input2 = [1,2,3,4,5,6,7,8,9,0]
evenSqr :: [Integer] -> [Integer]
-- evenSqr xs = map (^2) [x | x <- xs, even x]
-- even better: 
evenSqr xs = [x^2 | x <- xs, even x]

-- take a number and return a list of it's factors 
findFactors :: Integer -> [Integer]
findFactors n = [x | x <- [1..n], n `mod` x == 0]

-- Pairs with zip function:
pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)

-- List comprehension 
count :: Char -> String -> Int 
count c s = length [x | x <- s, x == c]


-- Exam 2 Review 

-- Building block functions: 
head' :: [a] -> a 
head' (x:xs) = x

tail' :: [a] -> [a]
tail' (x:xs) = xs




-- Compose 
myCompose :: (b -> c) -> (a -> b) -> (a -> c)
myCompose f g = \x -> f (g x)