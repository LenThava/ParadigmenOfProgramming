import Data.List (intercalate)

convertCopperToGSC :: Int -> String
convertCopperToGSC x =
    let (g, s, c) = splitGSC (abs x)
    in intercalate "-" (map twoDigits [g, s, c])
  where
    splitGSC n =
        let copper = n `mod` 100
            silver = (n `div` 100) `mod` 100
            gold   = (n `div` 10000) `mod` 100
        in (gold, silver, copper)

    twoDigits n
        | n < 10    = '0' : show n
        | otherwise = show n


extendedCopperToGSC :: Int -> String
extendedCopperToGSC x =
    prefix ++ money ++ " " ++ rank
  where
    prefix
        | x < 0     = "Debt: "
        | otherwise = ""

    money = convertCopperToGSC x

    ranks = [ r | r <- ["Initiate","Apprentice","Journeyman","Master","Grandmaster"] ]

    (g, _, _) =
        let n = abs x
            copper = n `mod` 100
            silver = (n `div` 100) `mod` 100
            gold   = (n `div` 10000) `mod` 100
        in (gold, silver, copper)

    rank = ranks !! (g `mod` 5)


extendedextendedCopperToGSC :: Int -> IO ()
extendedextendedCopperToGSC ini = do
    putStrLn "Enter cost in Copper:"
    input <- getLine
    let purchase = read input :: Int
        newTot = ini - purchase
    putStrLn (extendedCopperToGSC newTot)

main :: IO ()
main = do
    putStrLn "Enter initial copper amount:"
    input <- getLine
    let initial = read input :: Int
    putStrLn (extendedCopperToGSC initial)
    extendedextendedCopperToGSC initial