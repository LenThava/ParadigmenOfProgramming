import Data.List (isPrefixOf)
import Data.Char (chr)
import Data.Bits ((.&.), complement)

-- a) Convert list of integers to ASCII
getAsciiChars :: [Int] -> [Char]
getAsciiChars = map chr

-- b) Uncover the hidden message
uncover :: [[Int]] -> String
uncover [xs, ys, zs] =
    let mask = 0x0F
        triples = [ (x .&. mask, y .&. mask, z .&. mask)

                  | (x, y, z) <- zip3 xs ys zs
                  , (x .&. complement mask) /= (y .&. complement mask) 
                  ]
        values = [ z * 25 + y * 5 + x  | (x, y, z) <- triples ]
    in getAsciiChars values
uncover _ = ""

--read in file and turn it into a list of lists of int 
toLists :: FilePath -> IO [[Int]]
toLists path = do
    content <- readFile path
    let ls = lines content
        -- Find the line starting with prefix, drop the prefix, and parse the rest as [Int]
        parseLine pref = case filter (pref `isPrefixOf`) ls of
            (match:_) -> read (drop (length pref) match) :: [Int]
            []        -> []
    return [parseLine "x = ", parseLine "y = ", parseLine "z = "]

main :: IO ()
main = do
    lists <- toLists "encrypted_lists.txt"
    putStrLn $ uncover lists
