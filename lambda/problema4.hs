{-
Crie uma express ̃ao Lambda que resolva uma equa ̧c ̃ao de segundo grau da
formaax2+bx+cutilizandoa f ́ormula de Bhaskara.  Leia os coeficientes a, b e c
do teclado
-}

main = do
  aString <- getLine
  let a = (read aString :: Float)
  aString <- getLine
  let b = (read aString :: Float)
  aString <- getLine
  let c = (read aString :: Float)

  print ( (\x x1 x2 x3 -> x1*x*x + x2*x + x3) 1 a b c )
