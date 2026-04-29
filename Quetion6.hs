--We always assume that the user of these fuctions is smart enought to pass phiscally plousable stuff and correct maginitudes for SI Units
kineticEnergy :: Double -> Double -> Double
kineticEnergy m = \v -> 0.5 * m * v

energyForMass :: Double -> Double -> Double
energyForMass = kineticEnergy 

main :: IO ()
main = do 
    let v = [2,4,6]
        e = map (energyForMass 10) v
    putStrLn "Calculating E_k for m = 10kg and v = 2,4,6"
    print e