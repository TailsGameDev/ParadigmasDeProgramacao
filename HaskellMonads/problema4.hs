{-
Resumidamente:
calcPosicaoFinal ::  [(Int, Int)] -> Maybe (Int, Int)a  qual  deve  retornar
o ́ultimo elemento da lista, caso todos os movimentos do cavalo forem v ́alidos,
ou deve retornar Nothing,caso algum movimento foi inv ́alido.
-}

modulo :: Int -> Int
modulo q =
  if q > 0 then
    q
  else
    -q

movValido :: (Int, Int) -> (Int, Int) -> Bool
movValido (x1,y1) (x2,y2) =
  if (modulo(x2-x1)==2 && modulo(y2-y1)==1) || (modulo(x2-x1)==1 && modulo(y2-y1)==2) then
    (x2>=0) && (y2>=0)
  else
    False

posValida :: [(Int, Int)] -> Int -> Bool
posValida lt n =
  if n >= (length lt-1) then
    True
  else


calcPosicaoFinal ::  [(Int, Int)] -> Maybe (Int, Int)
