{-
Altere nosso exemplo da forma e inclua uma nova forma (Triangulo) no construtor
 do tipo Forma e tamb ́emcalcule sua  ́area.
-}
data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b a) = b*a/2.0

minhaForma :: Forma
minhaForma = (Retangulo 4 6)

main = do
  putStrLn ( show (area (Circulo 6.42)) )
  putStrLn ( show (area (Retangulo 4 5)) )
  putStrLn ( show (area minhaForma) )
  putStrLn ( show (area (Triangulo 4 5)) )
