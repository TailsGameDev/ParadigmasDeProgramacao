{-
Crie uma express ̃ao Lambda que receba 3 valores num ́ericos (a, b, c)
e retorne o maior deles.  N ̃ao utilizenenhuma forma de ordena ̧c ̃ao.
Leia os valores a, b, c do teclado.
-}

main = do
  aString <- getLine
  let a = (read aString :: Float)
  aString <- getLine
  let b = (read aString :: Float)
  aString <- getLine
  let c = (read aString :: Float)
  print( "O maior que digitaste foi: "++show( (\a b c -> if c >= a && c >=b then c else if a>b then a else b) a b c ))
  --print( "O maior que digitaste foi: "++show( (\a b c -> if ((\a b -> a if a>b else b) a b) > c then ( ( (\a b -> a if a>b else b) a b) ) else c) a b c ))
