{-
Crie uma funcao que receba dois numeros x e y e retorne se x ́e divisıvel
 por y.  Leia x e y do teclado.
-}

divisivel:: Int -> Int -> String
divisivel a b =
  if ( (mod a b) == 0) then
    "a eh divisivel por b"
  else
    "a nao eh divisivel por b"

main = do
  print("digite um valor a")
  xString <- getLine
  let x = (read xString :: Int)
  print("digite um valor  b")
  yString <- getLine
  let y = (read yString :: Int)
  print( (divisivel x y) )
