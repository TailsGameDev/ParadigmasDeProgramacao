
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

matriz = [0, 0, 0, 0,
          2, 0, 0, 0,
          0, 0, 0, 0,
          0, 0, 0, 0]

tamanhoLinha :: [Int] -> Int -- eh soh uma raiz quadrada devolvendo Int
tamanhoLinha matrix = round (fromIntegral(length matrix) **0.5)

getxym :: Int -> Int -> [Int] -> Int
getxym x y m = m !! (x + y*(tamanhoLinha m))

--           x     y     matriz
getLinha :: Int -> Int -> [Int] -> String
getLinha x y m =
  if (x >= (tamanhoLinha matriz) -1) then
    show ( getxym x y m )
  else
    show ( getxym x y m ) ++ " " ++ (getLinha (x+1) y m)

--           x     y     matriz
showMatriz :: Int-> Int-> [Int] -> String
showMatriz x y m =
  if (y >= (tamanhoLinha matriz)-1) then
    (getLinha x y m) ++ "\n"
  else
    (getLinha x y m) ++ "\n" ++ (showMatriz x (y+1) m)

--              n      x      y      matriz   tem?
jaTemNaLinha :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaLinha n x y m =
  if x >= ( (tamanhoLinha m) -1) then
    False
  else
    if n == getxym x y m then
      True
    else
      jaTemNaLinha n (x+1) y m

jaTemNaColuna :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaColuna n x y m =
  if y >= ( (tamanhoLinha m) -1) then
    False
  else
    if n == getxym x y m then
      True
    else
      jaTemNaColuna n x (y+1) m

main = do
  putStr( (showMatriz 0 0 matriz) )
  print( (jaTemNaColuna 0 0 0 matriz) )
