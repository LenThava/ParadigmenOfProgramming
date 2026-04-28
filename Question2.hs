
multiplesOfThree :: [Integer]
multiplesOfThree = [3, 6 ..]

numberSquarePairs :: [(Integer, Integer)]
numberSquarePairs = [(n, n * n) | n <- [1 ..]]

divisibleByThreeAndFive :: [Integer]
divisibleByThreeAndFive = [15, 30 ..]


printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')


main :: IO ()
main = do
  printSection "Question 2"

  putStrLn "2a) first 15 multiples of 3"
  print (take 15 multiplesOfThree)

  putStrLn "2b) first 10 natural-number/square pairs"
  print (take 10 numberSquarePairs)

  putStrLn "2c) first 15 numbers divisible by both 3 and 5"
  print (take 15 divisibleByThreeAndFive)
