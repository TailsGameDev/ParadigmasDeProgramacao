{-
Pesquise como enumera ̧c ̃oes em Haskell.  Fa ̧ca um pequeno exemplo.
-}

data Level = Lower | Middle | Upper
    deriving (Show, Eq, Ord)

main = do
  print( "um dos itens do enum eh: "++show(Middle::Level) )
