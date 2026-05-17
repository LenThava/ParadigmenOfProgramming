import Data.List (isPrefixOf)
import Data.Char (chr)
import Data.Bits ((.&.), complement)

-- a) Convert list of integers to ASCII
getAsciiChars :: [Int] -> [Char] 
getAsciiChars = map chr

-- b) Uncover the hidden message
uncover :: [[Int]] -> String
uncover [xs, ys, zs] =
    let mask = 0x0F -- fancy 15 ... ;)
                    -- we could do mask = 15 or mask = 0b00001111
        triples = [ (x .&. mask, y .&. mask, z .&. mask)
                    -- x .&. mask == x mod 15 
                  | (x, y, z) <- zip3 xs ys zs
                  , (x .&. complement mask) /= (y .&. complement mask) 
                  ]
                  -- just want to state the exercise is kinda missleading and it took quite some time to figure out that it is z *25 + y5 + x and NOT X*25+ 5*y+ x
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
            -- we start readin exactly wehen the structure matches an int arr.
            (match:_) -> read (drop (length pref) match) :: [Int]
            []        -> []
            -- only pars the lines we neeed 
    return [parseLine "x = ", parseLine "y = ", parseLine "z = "]

main :: IO ()
main = do
    lists <- toLists "encrypted_lists.txt"
    putStrLn $ uncover lists
