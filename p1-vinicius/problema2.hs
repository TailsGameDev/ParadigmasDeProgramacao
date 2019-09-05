fritz :: Int -> Int
fritz 0 = 0
fritz 1 = 1
fritz n = (fritz (n - 1) `quot` 2) + 3 * fritz (n - 2)

main = do
    print (fritz 11)