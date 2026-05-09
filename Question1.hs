
-- Question 1: Functional List Operations
-- Each task is implemented as a separate function. The main method at the
-- bottom runs small example calls for all parts of the question.

-- 1a)
-- Sum all values in the input list and multiply the result by 5.
-- The Num constraint keeps this function general: it works for numeric types
-- such as Int, Integer, Float, and Double.
sumTimesFive :: Num a => [a] -> a
sumTimesFive xs = sum xs * 5


-- 1b)
-- Split a list into elements at even indices and elements at odd indices.
-- The first list contains positions 0, 2, 4, ... and the second list contains
-- positions 1, 3, 5, ...
--
-- The recursion consumes two elements at a time. The first element of the pair
-- is placed in the even-index list, and the second element is placed in the
-- odd-index list. The base cases handle empty and one-element lists.
splitEvenOddIndices :: [a] -> ([a], [a])
splitEvenOddIndices [] = ([], [])
splitEvenOddIndices [x] = ([x], [])
splitEvenOddIndices (x:y:rest) =
  let (evenItems, oddItems) = splitEvenOddIndices rest
   in (x : evenItems, y : oddItems)


-- 1c)
-- Reverse only the middle of a string while keeping the first and last
-- characters fixed. Empty strings and one-character strings are returned
-- unchanged because they do not have a middle part.
--
-- In the final pattern, first is kept as the first character. The rest of the
-- string contains the middle characters plus the original final character, so
-- init rest gives the middle part and last rest gives the final character.
reverseMiddle :: String -> String
reverseMiddle [] = []
reverseMiddle [x] = [x]
reverseMiddle (first:rest) = first : reverse (init rest) ++ [last rest]


-- 1d)
-- Check whether a positive integer is a perfect square.
-- A number is a perfect square if there is an integer root such that
-- root * root is exactly the original number.
--
-- sqrt works on floating-point numbers, so n is converted to Double first.
-- floor removes any fractional part, and the final multiplication checks
-- whether the rounded-down root was exact.
isPerfectSquare :: Integer -> Bool
isPerfectSquare n
  | n <= 0 = False
  | otherwise = root * root == n
  where
    root = floor (sqrt (fromIntegral n :: Double))

-- 1e)
-- Count how many even numbers occur in a list.
-- The list comprehension keeps only elements for which even x is True, and
-- length counts how many such elements were selected.
countEvenNumbers :: [Integer] -> Int
countEvenNumbers xs = length [x | x <- xs, even x]


-- 1f)
-- Compute the greatest common divisor of three integers.
-- Haskell's built-in gcd handles two numbers, so it is applied twice:
-- first to a and b, then to that result and c.
gcdThree :: Integer -> Integer -> Integer -> Integer
gcdThree a b c = gcd (gcd a b) c

-- Helper for 1g)
-- Return all proper divisors of n. A proper divisor divides n exactly but is
-- smaller than n itself.
--
-- It is enough to search up to n `div` 2, because a number larger than half of
-- n cannot be a proper divisor of n.
properDivisors :: Int -> [Int]
properDivisors n = [d | d <- [1 .. n `div` 2], n `mod` d == 0]


-- 1g)
-- Find all perfect numbers below 10000.
-- A number is perfect when the sum of its proper divisors is equal to the
-- number itself. For example, 6 is perfect because 1 + 2 + 3 = 6.
perfectNumbersBelow10000 :: [Int]
perfectNumbersBelow10000 =
  [n | n <- [1 .. 9999], sum (properDivisors n) == n]


-- Small helper to make the printed test output easier to read.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')

-- Run example tests for all functions in Question 1.
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
