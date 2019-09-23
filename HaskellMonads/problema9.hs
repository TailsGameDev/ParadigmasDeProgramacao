{-
Pesquise sobre o Monad Either dispon´ıvel no Haskell. Fa¸ca um pequeno exemplo
e explique o seu funcionamento
-}
par :: Int -> Either String Bool
par n =
    if (mod n 2)==0 then
      Right True
    else
      Left ("impar")

main = do
  print ((par 7))
