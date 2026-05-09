
-- Question 1: Functional List Operations
-- Each part is implemented as one small function and tested in main.

-- 1a)
-- Sum the list and multiply the result by 5.
sumTimesFive :: Num a => [a] -> a
sumTimesFive xs = sum xs * 5


-- 1b)
-- Split the list into values at even and odd indices.
-- The recursion takes two elements at a time: the first goes to the even list,
-- the second to the odd list.
splitEvenOddIndices :: [a] -> ([a], [a])
splitEvenOddIndices [] = ([], [])
splitEvenOddIndices [x] = ([x], [])
splitEvenOddIndices (x:y:rest) =
  let (evenItems, oddItems) = splitEvenOddIndices rest
   in (x : evenItems, y : oddItems)


-- 1c)
-- Reverse only the middle of a string.
-- The first and last characters stay where they are.
reverseMiddle :: String -> String
reverseMiddle [] = []
reverseMiddle [x] = [x]
reverseMiddle (first:rest) = first : reverse (init rest) ++ [last rest]


-- 1d)
-- Check whether a positive integer is a perfect square.
-- We take the square root, round it down, and square it again to check.
isPerfectSquare :: Integer -> Bool
isPerfectSquare n
  | n <= 0 = False
  | otherwise = root * root == n
  where
    root = floor (sqrt (fromIntegral n :: Double))

-- 1e)
-- Keep only even numbers with a list comprehension and count them.
countEvenNumbers :: [Integer] -> Int
countEvenNumbers xs = length [x | x <- xs, even x]


-- 1f)
-- Use gcd twice to get the greatest common divisor of three numbers.
gcdThree :: Integer -> Integer -> Integer -> Integer
gcdThree a b c = gcd (gcd a b) c

-- Helper for 1g)
-- Find all divisors of n that are smaller than n itself.
properDivisors :: Int -> [Int]
properDivisors n = [d | d <- [1 .. n `div` 2], n `mod` d == 0]


-- 1g)
-- A number is perfect if it equals the sum of its proper divisors.
-- Here we check all numbers below 10000.
perfectNumbersBelow10000 :: [Int]
perfectNumbersBelow10000 =
  [n | n <- [1 .. 9999], sum (properDivisors n) == n]


-- Print a simple section heading for the test output.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')

-- Run small example tests for all parts of Question 1.
main :: IO ()
main = do
  printSection "Question 1"

  putStrLn "1a) sumTimesFive [1,2,3,4]"
  print (sumTimesFive [1, 2, 3, 4 :: Integer])

  putStrLn "1b) splitEvenOddIndices [1,2,3,4,5]"
  print (splitEvenOddIndices [1, 2, 3, 4, 5 :: Integer])

  putStrLn "1c) reverseMiddle \"Haskell\""
  print (reverseMiddle "Haskell")

  putStrLn "1d) isPerfectSquare 16 and 20"
  print (isPerfectSquare 16, isPerfectSquare 20)

  putStrLn "1e) countEvenNumbers [1..10]"
  print (countEvenNumbers [1 .. 10])

  putStrLn "1f) gcdThree 24 60 96"
  print (gcdThree 24 60 96)

  putStrLn "1g) perfectNumbersBelow10000"
  print perfectNumbersBelow10000
