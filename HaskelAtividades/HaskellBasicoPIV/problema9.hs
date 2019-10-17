{-
Crie uma fun ̧c ̃ao que dados dois pontos no espa ̧co 3D, (x1,  y1,  z1) e
(x2,  y2,  z2),  compute a distˆanciaentre eles.  Leia as posi ̧c ̃oes dos pontos
 do teclado.
-}

funcao :: Float->Float->Float->Float->Float->Float->Float
funcao a b c x y z = ( (x-a)**2 + (y-b)**2 + (z-c)**2 ) ** 0.5

main = do
  print("digite um valor a")
  xString <- getLine
  let a = (read xString :: Float)
  print("digite um valor  b")
  yString <- getLine
  let b = (read yString :: Float)
  print("digite um valor c")
  zString <- getLine
  let c = (read zString :: Float)
  print("digite um valor x")
  oXString <- getLine
  let oX = (read oXString :: Float)
  print("digite um valor y")
  oYString <- getLine
  let oY = (read oYString :: Float)
  print("digite um valor z")
  oZString <- getLine
  let oZ = (read oZString :: Float)

  print((funcao a b c oX oY oZ))
