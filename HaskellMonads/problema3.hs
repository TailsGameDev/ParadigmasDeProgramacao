{-
crie uma fun ̧c ̃ao com a assinatura
formaTriangulo ::  (Float, Float) -> (Float, Float) -> (Float,Float) -> Maybe Float,
a qual recebe trˆes pontos 2D como parˆametro e retorna a  ́area do triˆangulo
ou Nothing, caso os trˆes pontos n ̃ao formem um triˆangulo.  Utilize o
conceito de Monad para esta quest ̃ao.

formaTriangulo ::  (Float, Float) -> (Float, Float) -> (Float,Float) -> Maybe Float
formaTriangulo = Just myarea
-}

modulo :: Float -> Float
modulo q =
  if q > 0 then
    q
  else
    -q
formaTriangulo :: (Float, Float) -> (Float, Float) -> (Float,Float) -> Maybe Float
formaTriangulo (x1,y1) (x2,y2) (x3,y3) | (y2*x3 + x1*y3 + y1*x2 -x1*y2 - y1*x3 - x2*y3) == 0 = Nothing
          | otherwise = Just (modulo ((y2*x3 + x1*y3 + y1*x2 -x1*y2 - y1*x3 - x2*y3)/2) )

main = do
  print ( formaTriangulo (0,0) (1,1) (1,0) )
  print ( formaTriangulo (0,0) (1,1) (1,1) )
