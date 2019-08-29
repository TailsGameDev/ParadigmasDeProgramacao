{-
Crie uma fun ̧c ̃ao com assinaturamesmosElementos ::  [Int] -> [Int] -> Bool
, a qual retornese duas listas possuem os mesmos elementos,
 independentemente da ordem em que eles aparecem e don ́umero de vezes
 que eles possam se repetir.N ̃ao utilizenenhuma fun ̧c ̃ao pronta to Haskell
 para estatarefa.
-}

contem:: [Int] -> Int -> Bool
contem [] _ = False
contem a:b n =
  if (a==n) then
    True
  else
    contem b n

mesmosElementos ::  [Int] -> [Int] -> Bool
mesmosElementos [] l2] = True
mesmosElementos a:b l2 =
  if (contem l2 a) then
    mesmosElementos b

mesmosElementos ::  [Int] -> [Int] -> Bool
mesmosElementos 
