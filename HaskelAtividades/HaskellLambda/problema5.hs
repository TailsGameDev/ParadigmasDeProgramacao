{-
Crie uma express ̃ao Lambda que dados dois pontos no espa ̧co 3D,
(x1, y1, z1) e (x2, y2, z2), compute adistˆancia entre eles.
Leia as posi ̧c ̃oes dos pontos do teclado
-}

main = do
  aString <- getLine
  let x1 = (read aString :: Float)
  aString <- getLine
  let y1 = (read aString :: Float)
  aString <- getLine
  let z1 = (read aString :: Float)
  aString <- getLine
  let x2 = (read aString :: Float)
  aString <- getLine
  let y2 = (read aString :: Float)
  aString <- getLine
  let z2 = (read aString :: Float)

  print( "A distancia entre os pontos eh: " ++ show (  ( \x1 y1 z1 x2 y2 z2 -> ( (x2-x1)**2+(y2-y1)**2+(z2-z1)**2 )**0.5 ) x1 y1 z1 x2 y2 z2) )
