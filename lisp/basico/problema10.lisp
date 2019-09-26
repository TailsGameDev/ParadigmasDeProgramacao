{-
Crie uma fun ̧c ̃ao que receba 3 valores num ́ericos (a, b, c) e retorne
 o maior deles.  N ̃ao utilize nenhumaforma de ordena ̧c ̃ao.
   Leia os valores a, b, c do teclado.
-}

maior:: Float->Float->Float
maior m n =
  if m > n then
    m
  else
    n

funcao :: Float-> Float -> Float -> Float
funcao a b c = maior a (maior b c)

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

  print(funcao x y z)
