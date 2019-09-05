data Ponto = Ponto2D Float Float

data Retangulo = Retangulo Ponto Ponto

--distancia :: Ponto -> Ponto -> Float
--distancia (Ponto2D x1 y1) (Ponto2D x2 y2) = ( (x2-x1)**2 + (y2-y1)**2 ) ** 0.5
dentro :: Retangulo -> [Ponto] -> [[Ponto]]
dentro ret pts = [ [p,p] | p <- pts ]

meuRet = Retangulo (Ponto2D 0 0) (Ponto2D 1 1)

ponto

main = do
  print( meuRet )
  --print( ( dentro (Retangulo (Ponto 0 0) (Ponto 1 1) )) ) )
  --print( (distancia (Ponto2D 1 0) (Ponto2D 0 0) ) )
