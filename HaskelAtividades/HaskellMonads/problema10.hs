{-
Listas, em Haskell, tamb´em s˜ao Monads. Fa¸ca um pequeno exemplo utilizando
listas (e seus conceitos de Monads) e explique o seu funcionamento.

-}



main = do
  let generation = replicate 3
  print (["bunny"] >>= generation)
