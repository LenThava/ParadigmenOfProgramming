-- Programming Paradigms - Haskell FS 2026
-- Exercise 2, Question 1 and Question 2
--
-- This file keeps all requested functions for Q1 and Q2 together.
-- The main function at the bottom prints small test runs, so the file can be
-- executed directly with:
--
--     runghc Question1_2.hs
--
-- or compiled with:
--
--     ghc Question1_2.hs

module Main where

-- Question 1a
-- Sum all numbers in a list and multiply that sum by 5.
-- The Num typeclass keeps this usable for Int, Integer, Double, etc.
sumTimesFive :: Num a => [a] -> a
sumTimesFive xs = sum xs * 5

-- Question 1b
-- Split a list into two lists by index position. The first element has index 0,
-- so it belongs to the even-index list.
--
-- The recursion consumes two elements at a time:
--   x goes to the even-index list
--   y goes to the odd-index list
-- The remaining list is handled in the same way.
splitEvenOddIndices :: [a] -> ([a], [a])
splitEvenOddIndices [] = ([], [])
splitEvenOddIndices [x] = ([x], [])
splitEvenOddIndices (x:y:rest) =
  let (evenItems, oddItems) = splitEvenOddIndices rest
   in (x : evenItems, y : oddItems)

-- Question 1c
-- Reverse only the inside of a string. The first and last characters stay where
-- they are. For strings with length 0 or 1, there is no inside part to reverse.
reverseMiddle :: String -> String
reverseMiddle [] = []
reverseMiddle [x] = [x]
reverseMiddle (first:rest) = first : reverse (init rest) ++ [last rest]

-- Question 1d
-- A positive integer is a perfect square when its square root is a whole number.
-- We compute an integer candidate root by taking the floor of the floating-point
-- square root, then square that candidate again to verify the result exactly.
isPerfectSquare :: Integer -> Bool
isPerfectSquare n
  | n <= 0 = False
  | otherwise = root * root == n
  where
    root = floor (sqrt (fromIntegral n :: Double))

-- Question 1e
-- Count all even values. The helper expression creates a list containing only
-- the even numbers, and length returns how many survived the filter.
countEvenNumbers :: [Integer] -> Int
countEvenNumbers xs = length [x | x <- xs, even x]

-- Question 1f
-- The GCD of three integers can be calculated by first finding the GCD of the
-- first two, then combining that result with the third number.
gcdThree :: Integer -> Integer -> Integer -> Integer
gcdThree a b c = gcd (gcd a b) c

-- Question 1g helper
-- Proper divisors are positive divisors smaller than the number itself.
-- It is enough to check up to n `div` 2, because no larger number can divide n
-- without being n itself.
properDivisors :: Int -> [Int]
properDivisors n = [d | d <- [1 .. n `div` 2], n `mod` d == 0]

-- Question 1g
-- A perfect number is equal to the sum of its proper divisors.
perfectNumbersBelow10000 :: [Int]
perfectNumbersBelow10000 =
  [n | n <- [1 .. 9999], sum (properDivisors n) == n]

-- Question 2a
-- This is an infinite list. Haskell will not build the whole list at once;
-- values are only produced when something demands them, such as take 15.
multiplesOfThree :: [Integer]
multiplesOfThree = [3, 6 ..]

-- Question 2b
-- Pair every natural number with its square. The list is infinite, but lazy
-- evaluation means the program can still safely use a finite prefix of it.
numberSquarePairs :: [(Integer, Integer)]
numberSquarePairs = [(n, n * n) | n <- [1 ..]]

-- Question 2c
-- Numbers divisible by both 3 and 5 are exactly the multiples of 15.
-- This definition is also infinite.
divisibleByThreeAndFive :: [Integer]
divisibleByThreeAndFive = [15, 30 ..]

-- Small helper for the demonstration output in main.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')

-- One main method is used to test all tasks from Question 1 and Question 2.
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

  printSection "Question 2"
  putStrLn "2a) first 15 multiples of 3"
  print (take 15 multiplesOfThree)

  putStrLn "2b) first 10 natural-number/square pairs"
  print (take 10 numberSquarePairs)

  putStrLn "2c) first 15 numbers divisible by both 3 and 5"
  print (take 15 divisibleByThreeAndFive)
