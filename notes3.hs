-- notes 3/18/24
-- Main Methods

-- Printing a line
main = putStrLn "Hello World!"

-- You need to specify io in the type to use it, this doesn't work:
-- foo :: Int -> Int 
-- foo n = putStrLn "Hello World!" (n+1)

-- Can use 
-- foo :: IO String 
-- to ret string.
foo :: IO String
foo = do
  c1 <- getChar
  c2 <- getChar
  return (c1 : c2 : [])

  -- sub-expression:
foo2 :: IO [Char]
foo2 = do 
  c1 <- getChar 
  c2 <- getChar 
  let str = c1 : c2 : []
  -- putStrLn str    -- takes a string, returns an IO String
  return ('\n' : str)

baz :: IO () 
baz = do 
  str1 <- foo 
  str2 <- foo 
  putStrLn (str1 ++ str2)

-- returns :: a -> IO a