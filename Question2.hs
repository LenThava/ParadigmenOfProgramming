
-- Question 2: Simple Infinite Lists
-- Haskell can represent infinite lists because of lazy evaluation. As explained
-- in the written solution, the whole list is not computed immediately. Values
-- are produced only when they are demanded, for example by take 15.

-- 2a)
-- Infinite list of positive multiples of 3.
-- The range syntax [3, 6 ..] starts at 3, uses 6 as the next element, and
-- therefore continues with the same step size of 3 forever.
multiplesOfThree :: [Integer]
multiplesOfThree = [3, 6 ..]

-- 2b)
-- Infinite list of pairs (n, n^2), starting with n = 1.
-- The list comprehension reads values from the infinite list [1 ..] and
-- builds one pair for each natural number.
numberSquarePairs :: [(Integer, Integer)]
numberSquarePairs = [(n, n * n) | n <- [1 ..]]

-- 2c)
-- Infinite list of numbers divisible by both 3 and 5.
-- A number divisible by both 3 and 5 is a multiple of 15, so this list can be
-- generated directly with step size 15.
divisibleByThreeAndFive :: [Integer]
divisibleByThreeAndFive = [15, 30 ..]


-- Small helper to make the printed test output easier to read.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')


-- Run finite demonstrations of the infinite lists.
-- The calls to take are important: printing an entire infinite list would never
-- finish, but printing a finite prefix works because Haskell evaluates only the
-- requested elements.
main :: IO ()
main = do
  printSection "Question 2"

  putStrLn "2a) first 15 multiples of 3"
  print (take 15 multiplesOfThree)

  putStrLn "2b) first 10 natural-number/square pairs"
  print (take 10 numberSquarePairs)

  putStrLn "2c) first 15 numbers divisible by both 3 and 5"
  print (take 15 divisibleByThreeAndFive)
