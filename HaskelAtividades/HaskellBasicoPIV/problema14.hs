{-
Crie uma fun ̧c ̃ao que receba dois n ́umeros x e y e determine se eles s ̃ao
 coprimos.  Dois n ́umeros s ̃ao ditoscoprimos se o m ́aximo divisor comum entre
  eles  ́e 1.  Leia x e y do teclado.
-}

maior:: Int->Int->Int
maior m n =
  if m > n then
    m
  else
    n

menor :: Int->Int->Int
menor m n =
  if m < n then
    m
  else
    n

euclides :: Int->Int->Int
euclides a 0 = a
euclides a b = euclides b (mod a b)

coprimos:: Int->Int->String
coprimos a b =
  if (euclides a b) == 1 then
    "coprimos"
  else
    "nao coprimos"

main = do
  print("digite um valor a")
  xString <- getLine
  let x = (read xString :: Int)
  print("digite um valor  b")
  yString <- getLine
  let y = (read yString :: Int)

  print("Os numeros sao:")
  print((coprimos x y))
