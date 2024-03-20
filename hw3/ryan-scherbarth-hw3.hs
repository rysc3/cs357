{-
Submission rules:

- All text answers must be given in Haskell comment
  underneath the problem header.

- You must submit a single .hs file with the
  following name: firstName-lastName-hw3.hs.
  Failure to do so will result in -10 points.

- You will lose 10 points if you put a module statement
  at the top of the file.

- You will lose 10 points for any import statements you have
  in your file and will automatically miss any problems you used
  an imported function on.

- If your file doesn't compile you will lose 10 points and miss any
  problems that were causing the compilation errors.

- This means that any function which is causing compiler errors should
  be commented out. There will be no partial credit.

- You must use the skeleton file provided and must not alter any type
  signature. If you alter a type signature you will automatically miss
  that problem.

- You will lose 10 points if you include a *main* function in your file.
-}

-- Problem 1
curry' :: ((a, b) -> c) -> a -> b -> c
curry' f x y = f (x, y)

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y


-- Problem 2
unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x | p x = [] 
               | otherwise = h x : unfold p h t (t x)

chop8 :: [a] -> [[a]]
chop8 = unfold null (take 8) (drop 8)


map' :: (a -> b) -> [a] -> [b]
map' f = unfold null (f . head) tail

iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (\_ -> False) id f


-- Problem 3
concatER :: [[a]] -> [a]
concatER [[]] = [] 
concatER (x:xs) = x ++ concatER xs

concatFR :: [[a]] -> [a]
concatFR = foldr (++) []

concatFL :: [[a]] -> [a]
concatFL = undefined -- foldl ...


-- Problem 4
disjunction2 :: (a -> Bool) -> (a -> Bool) -> a -> Bool
disjunction2 p1 p2 x = undefined


-- Problem 5
disjunction :: [a -> Bool] -> a -> Bool
disjunction ps x = undefined -- foldr ...


-- Problem 6
deleteDupes :: Eq a => [a] -> [a]
deleteDupes xs = undefined -- foldr ...


-- Problem 7
tally :: (a -> Bool) -> [a] -> Int
tally p xs = undefined -- foldl ...


-- Problem 8
bangBang :: [a] -> Int -> a
bangBang xs n = undefined -- foldr ... zip ...


-- Problem 9
increasing :: Ord a => [a] -> Bool
increasing xs = undefined -- foldr ... zip ...


-- Problem 10
decimate :: [a] -> [a]
decimate xs = undefined -- foldl ...  


-- Problem 11
encipher :: Eq a => [a] -> [b] -> [a] -> [b]
encipher xs ys zs = undefined


-- Problem 12
prefixSum :: Num a => [a] -> [a]
prefixSum xs = undefined


-- Problem 13
minesweeper :: [String] -> [String]
minesweeper grid = undefined

-- Helper function provided 
intToDigit :: Int -> Char
intToDigit 0 = '0'
intToDigit 1 = '1'
intToDigit 2 = '2'
intToDigit 3 = '3'
intToDigit 4 = '4'
intToDigit 5 = '5'
intToDigit 6 = '6'
intToDigit 7 = '7'
intToDigit 8 = '8'
intToDigit 9 = '9'