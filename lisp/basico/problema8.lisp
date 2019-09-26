{-
Crie uma fun ̧c ̃ao que resolva uma equa ̧c ̃ao de segundo grau da formaa
x2+bx+cutilizando a f ́ormulade Bhaskara.  Leia os coeficientes a, b e c do teclado.
-}

funcao :: Float->Float->Float->Float->Float
funcao a b c x = a*x*x + b*x + c

main = do
  print("digite um valor a")
  xString <- getLine
  let x = (read xString :: Float)
  print("digite um valor  b")
  yString <- getLine
  let y = (read yString :: Float)
  print("digite um valor c")
  zString <- getLine
  let z = (read zString :: Float)
  print("digite um valor x")
  oXString <- getLine
  let oX = (read oXString :: Float)

  print("eq de segundo grau =")
  print( (funcao x y z oX) )
