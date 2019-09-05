multiplos :: Int -> [Int]
multiplos 0 = []
multiplos n
    | (n `mod` 2 == 0 && n `mod` 5 /= 0) = (multiplos (n - 1)++[n]) 
    | otherwise = multiplos (n - 1)

main = do
    print (multiplos 15)