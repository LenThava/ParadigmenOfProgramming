toDigits :: Integer -> [Integer]
toDigits n
    | n <= 0    = []
    | otherwise = map (read . (:[])) (show n)

validate :: Integer -> Bool
validate n =
    let digits = toDigits n
    in length digits == 16 && luhn digits

luhn :: [Integer] -> Bool
luhn digits =
    sum (adjust (doubleEverySecondFromRight digits)) `mod` 10 == 0
  where
    doubleEverySecondFromRight :: [Integer] -> [Integer]
    doubleEverySecondFromRight =
        reverse .
        zipWith ($) (cycle [id, (*2)]) .
        reverse
    adjust :: [Integer] -> [Integer]
    adjust = map (\d -> if d > 9 then d - 9 else d)


identifyVendor :: [Integer] -> String
identifyVendor digits =
    case digits of
        (4:_)             -> "Visa"
        (5:x:_) | x <= 5 -> "Mastercard"
        (3:4:_)           -> "American Express"
        (3:7:_)           -> "American Express"
        _                 -> "Unknown Vendor"


generateCheckDigit :: [Integer] -> Integer
generateCheckDigit digits =
    case [ d | d <- [0..9], luhn (digits ++ [d]) ] of
        (d:_) -> d
        []    -> error "No valid check digit found"

main :: IO ()
main = do
    putStrLn "=== Credit Card Utilities Demo ==="

    -- Example valid Visa number (passes Luhn)
    let visaNumber = 4539682995824395
        visaDigits = toDigits visaNumber

    putStrLn "\n1) Validate a known card number:"
    print visaNumber
    putStrLn $ "Vendor: " ++ identifyVendor visaDigits
    putStrLn $ "Valid (Luhn): " ++ show (validate visaNumber)

    -- Generate a check digit for a 15-digit prefix
    putStrLn "\n2) Generate check digit for a 15-digit prefix:"
    let prefix = [4,5,3,9,6,8,2,9,9,5,8,2,4,3,9]  -- Visa prefix
        checkDigit = generateCheckDigit prefix
        fullNumber = prefix ++ [checkDigit]

    putStrLn $ "Prefix:      " ++ show prefix
    putStrLn $ "Check digit: " ++ show checkDigit
    putStrLn $ "Full number: " ++ show fullNumber
    putStrLn $ "Valid (Luhn): " ++ show (luhn fullNumber)
    putStrLn $ "Vendor: " ++ identifyVendor fullNumber

    -- Try an invalid number
    putStrLn "\n3) Test an invalid number:"
    let badNumber = 1234567812345678
    print badNumber
    putStrLn $ "Valid (Luhn): " ++ show (validate badNumber)
    putStrLn $ "Vendor: " ++ identifyVendor (toDigits badNumber)
    
    putStrLn "\n4) Test 79927398713 (classic Luhn example with leading 0):"

    let digitsWithLeadingZero = [0,0,0,7,9,9,2,7,3,9,8,7,1,3]
        checkDigit = generateCheckDigit digitsWithLeadingZero
        fullDigits = digitsWithLeadingZero ++ [checkDigit]

    putStrLn $ "Digits (with leading 0): " ++ show digitsWithLeadingZero
    putStrLn $ "Check digit: " ++ show checkDigit
    putStrLn $ "Full digits: " ++ show fullDigits
    putStrLn $ "Valid (Luhn): " ++ show (luhn fullDigits)
