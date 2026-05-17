
-- Q2
-- infinite lists: Haskell nature allows us to only evaluate "requested" parts
-- noted in the pdf.

-- 2a
-- infinite list for the positive mulitplier of 3
multiplesOfThree :: [Integer]
multiplesOfThree = [3, 6 ..]

-- 2b
-- infinite list of pairs which have their number and its corresponding square
numberSquarePairs :: [(Integer, Integer)]
numberSquarePairs = [(n, n * n) | n <- [1 ..]]

-- 2c
-- those are multiples of 15 becausethey are divisible by 5 and 3
divisibleByThreeAndFive :: [Integer]
divisibleByThreeAndFive = [15, 30 ..]


-- we have the infinite lists here and the finite prefixes are shown
main :: IO ()
main = do
  putStrLn "2a first 15 mult. of 3"
  print (take 15 multiplesOfThree)

  putStrLn "2b first 10 int and square pairs"
  print (take 10 numberSquarePairs)

  putStrLn "2c first 15 numbers div. by 3 and 5"
  print (take 15 divisibleByThreeAndFive)
