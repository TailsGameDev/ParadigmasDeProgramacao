{-
Crie uma fun ̧c ̃ao que receba dois n ́umeros x e y e retorne o m ́ınimo m ́ultiplo
 comum (DICA: use a fun ̧c ̃aodo m ́aximo divisor comum j ́a criada).
   Leia x e y do teclado.
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

mmc :: Int-> Int -> Int
mmc a b = ( div (a * b) (euclides a b) )

main = do
  print("digite um valor a")
  xString <- getLine
  let x = (read xString :: Int)
  print("digite um valor  b")
  yString <- getLine
  let y = (read yString :: Int)

  print("O MMC eh: ")
  print((mmc x y))
