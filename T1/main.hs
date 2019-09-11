
{-
representacao: matriz com duas colunas e duas colunas a mais para armazenar
a quantidade de predios que pode ser vista naquela linha

matriz trivial:

vazia
   _ _
1  _ _ _
_  _ _ _
   _ _


solucao:
   _ _
1  2 1 _
_  1 2 _
   _ _
-}

matriz = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

tamanhoLinha :: [Int] -> Int -- eh soh uma raiz quadrada devolvendo Int
tamanhoLinha matrix = round (fromIntegral(length matrix) **0.5)

--           x     y     matriz
getLinha :: Int -> Int -> [Int] -> String
getLinha x y m =
  if (x >= (tamanhoLinha matriz) -1) then
    show (matriz !! (x + y*(tamanhoLinha m)) )
  else
    (show (matriz !! (x + y*(tamanhoLinha m))) ) ++ " " ++ (getLinha (x+1) y m)

--           x     y     matriz
showMatriz :: Int-> Int-> [Int] -> String
showMatriz x y m =
  if (y >= (tamanhoLinha matriz)-1) then
    (getLinha x y m)
  else
    (getLinha x y m) ++ "\n" ++ (showMatriz x (y+1) m)

main = do
  putStr( (showMatriz 0 0 matriz) )
