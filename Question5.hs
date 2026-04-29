customMap :: (a -> b) -> [a] -> [b]
customMap f [] = []
customMap f (x:xs) = f x : customMap f xs 

customFilter :: (a -> Bool) -> [a] -> [a]
customFilter _ [] = []
customFilter f (x:xs)
    | f x       = x : customFilter f xs
    | otherwise = customFilter f xs

transformValue:: Int -> Int
transformValue x = x^2

classifyValue:: Int -> String
classifyValue x
    | x > 20    = "large"
    | x < 10    = "small"
    | otherwise = "medium"

valueDistributionClassification:: [Int] -> String
valueDistributionClassification xs = answer ratio
  where
    labels = customMap classifyValue xs
    largeValues = customFilter (\x -> classifyValue x == "large") xs
    largeCount = length largeValues
    ratio = if null xs then 0 else fromIntegral largeCount / fromIntegral (length xs)

    answer r
      | r > (1.0/3.0) = "Many large values found."
      | otherwise      = "Only few large values found."

main :: IO ()
main = do
    print $ "Test Q5"
    let values = [12, 7, 25, 4, 18, 31, 9, 20, 15, 2]
    print $ "Test customMap with transformValue on values"
    print $ customMap transformValue values
    print $ "Test customMap with classifyValue on values"
    print $ customMap classifyValue values
    print $ "Test valueDistributionClassification on values"
    print $ valueDistributionClassification values

    print "Test with many large values"
    let manyLarge = [45, 60, 5, 22, 31, 8, 27, 19, 55, 42]
    print $ customMap transformValue manyLarge
    print $ customMap classifyValue manyLarge
    print $ valueDistributionClassification manyLarge