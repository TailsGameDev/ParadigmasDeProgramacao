{-
Pesquise sobre as classes Applicative e Functor. O que s˜ao? Para que servem?
Fa¸ca um pequeno exemplo utilizando cada uma delas

Functor aparentemente eh um tipo que permite ser mapeado com a fmap
fmap id  ==  id
fmap (f . g)  ==  fmap f . fmap g


-}

main = do
  print( (fmap negate (Just 2)) ) --aplica a funcao negate no monad Just 2
  print( (+) <$> Just 2 <*> Just 3 ) -- Application consegue fazer o fmap funcionar para 2 argumentos
