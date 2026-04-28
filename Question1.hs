-- Programming Paradigms - Haskell FS 2026
-- Exercise 2, Question 1
--
-- Run this file with:
--     runghc Question1.hs
--
-- This file contains all functions for Question 1 and one main method that
-- tests them with small example inputs.

-- Question 1a
-- Add all elements of the list and multiply the final sum by 5.
-- The type is general because sum and multiplication work for every Num type.
sumTimesFive :: Num a => [a] -> a
sumTimesFive xs = sum xs * 5

-- Question 1b
-- Split a list by index positions. Index 0 is even, index 1 is odd, and so on.
-- The function takes two elements at a time:
--   the first one goes into the even-index list
--   the second one goes into the odd-index list
-- Then the same logic is repeated for the rest of the list.
splitEvenOddIndices :: [a] -> ([a], [a])
splitEvenOddIndices [] = ([], [])
splitEvenOddIndices [x] = ([x], [])
splitEvenOddIndices (x:y:rest) =
  let (evenItems, oddItems) = splitEvenOddIndices rest
   in (x : evenItems, y : oddItems)

-- Question 1c
-- Keep the first and last characters in their original positions, but reverse
-- the middle part. Empty strings and one-character strings do not have a middle
-- part, so they are returned unchanged.
reverseMiddle :: String -> String
reverseMiddle [] = []
reverseMiddle [x] = [x]
reverseMiddle (first:rest) = first : reverse (init rest) ++ [last rest]

-- Question 1d
-- A positive integer is a perfect square when there exists an integer r with
-- r * r == n. The square root gives a candidate r. Squaring it again avoids
-- accepting numbers such as 20, where the square root is not an integer.
isPerfectSquare :: Integer -> Bool
isPerfectSquare n
  | n <= 0 = False
  | otherwise = root * root == n
  where
    root = floor (sqrt (fromIntegral n :: Double))

-- Question 1e
-- Keep only even numbers with a list comprehension, then count the remaining
-- elements. The result type is Int because length returns Int.
countEvenNumbers :: [Integer] -> Int
countEvenNumbers xs = length [x | x <- xs, even x]

-- Question 1f
-- The GCD of three integers can be found by applying gcd twice. First find the
-- GCD of a and b, then combine that result with c.
gcdThree :: Integer -> Integer -> Integer -> Integer
gcdThree a b c = gcd (gcd a b) c

-- Helper for Question 1g.
-- Proper divisors are positive divisors smaller than the number itself.
-- No divisor larger than n / 2 is needed, because such a number cannot divide n
-- except for n itself.
properDivisors :: Int -> [Int]
properDivisors n = [d | d <- [1 .. n `div` 2], n `mod` d == 0]

-- Question 1g
-- Check every number below 10000 and keep exactly the numbers that are equal to
-- the sum of their proper divisors.
perfectNumbersBelow10000 :: [Int]
perfectNumbersBelow10000 =
  [n | n <- [1 .. 9999], sum (properDivisors n) == n]

-- A small output helper for readable test output.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')

-- One main method tests all functions from Question 1.
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
