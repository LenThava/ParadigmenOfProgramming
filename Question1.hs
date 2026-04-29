
sumTimesFive :: Num a => [a] -> a
sumTimesFive xs = sum xs * 5


splitEvenOddIndices :: [a] -> ([a], [a])
splitEvenOddIndices [] = ([], [])
splitEvenOddIndices [x] = ([x], [])
splitEvenOddIndices (x:y:rest) =
  let (evenItems, oddItems) = splitEvenOddIndices rest
   in (x : evenItems, y : oddItems)


reverseMiddle :: String -> String
reverseMiddle [] = []
reverseMiddle [x] = [x]
reverseMiddle (first:rest) = first : reverse (init rest) ++ [last rest]


isPerfectSquare :: Integer -> Bool
isPerfectSquare n
  | n <= 0 = False
  | otherwise = root * root == n
  where
    root = floor (sqrt (fromIntegral n :: Double))

countEvenNumbers :: [Integer] -> Int
countEvenNumbers xs = length [x | x <- xs, even x]


gcdThree :: Integer -> Integer -> Integer -> Integer
gcdThree a b c = gcd (gcd a b) c

properDivisors :: Int -> [Int]
properDivisors n = [d | d <- [1 .. n `div` 2], n `mod` d == 0]


perfectNumbersBelow10000 :: [Int]
perfectNumbersBelow10000 =
  [n | n <- [1 .. 9999], sum (properDivisors n) == n]


printSection :: String -> IO ()
printSection title = do
  putStrLn ""
  putStrLn title
  putStrLn (replicate (length title) '-')

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

