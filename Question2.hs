-- Programming Paradigms - Haskell FS 2026
-- Exercise 2, Question 2
--
-- Run this file with:
--     runghc Question2.hs
--
-- This file contains the infinite-list functions for Question 2 and one main
-- method that prints finite prefixes of the infinite lists.

-- Question 2a
-- Infinite list of multiples of 3. Haskell's range syntax keeps stepping by 3:
-- 3, 6, 9, 12, ...
-- The whole list is never built at once because Haskell evaluates lazily.
multiplesOfThree :: [Integer]
multiplesOfThree = [3, 6 ..]

-- Question 2b
-- Infinite list of pairs. For each natural number n, the pair stores n and n*n.
-- The generator [1 ..] is infinite, but expressions such as take 10 only demand
-- a small finite part of it.
numberSquarePairs :: [(Integer, Integer)]
numberSquarePairs = [(n, n * n) | n <- [1 ..]]

-- Question 2c
-- A number divisible by both 3 and 5 is divisible by 15. Therefore this list can
-- be written as the infinite sequence of multiples of 15.
divisibleByThreeAndFive :: [Integer]
divisibleByThreeAndFive = [15, 30 ..]

-- A small output helper for readable test output.
printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')

-- One main method tests all functions from Question 2 by printing finite
-- prefixes. This is important because printing the full infinite lists would
-- never finish.
main :: IO ()
main = do
  printSection "Question 2"

  putStrLn "2a) first 15 multiples of 3"
  print (take 15 multiplesOfThree)

  putStrLn "2b) first 10 natural-number/square pairs"
  print (take 10 numberSquarePairs)

  putStrLn "2c) first 15 numbers divisible by both 3 and 5"
  print (take 15 divisibleByThreeAndFive)
