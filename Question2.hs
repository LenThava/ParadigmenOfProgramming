
-- Question 2: Simple Infinite Lists
-- These lists are infinite. Because Haskell is lazy, only the parts requested
-- with take are actually evaluated. This is also explained in the PDF solution.

-- 2a)
-- Infinite list of positive multiples of 3.
multiplesOfThree :: [Integer]
multiplesOfThree = [3, 6 ..]

-- 2b)
-- Infinite list of pairs containing a number and its square.
numberSquarePairs :: [(Integer, Integer)]
numberSquarePairs = [(n, n * n) | n <- [1 ..]]

-- 2c)
-- Numbers divisible by both 3 and 5 are exactly the multiples of 15.
divisibleByThreeAndFive :: [Integer]
divisibleByThreeAndFive = [15, 30 ..]


-- Print a simple section heading for the test output.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')


-- Show finite prefixes of the infinite lists.
main :: IO ()
main = do
  printSection "Question 2"

  putStrLn "2a) first 15 multiples of 3"
  print (take 15 multiplesOfThree)

  putStrLn "2b) first 10 natural-number/square pairs"
  print (take 10 numberSquarePairs)

  putStrLn "2c) first 15 numbers divisible by both 3 and 5"
  print (take 15 divisibleByThreeAndFive)
