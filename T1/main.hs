
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
          2, 3, 4, 0,
          0, 0, 0, 0,
          0, 0, 0, 0]

tam = tamanhoLinha matriz

tamanhoLinha :: [Int] -> Int -- eh soh uma raiz quadrada devolvendo Int
tamanhoLinha matrix = round (fromIntegral(length matrix) **0.5)

getxym :: Int -> Int -> [Int] -> Int
getxym x y m = m !! (x + y*(tam))

--           x     y     matriz
getLinha :: Int -> Int -> [Int] -> String
getLinha x y m =
  if (x >= (tam) -1) then
    show ( getxym x y m )
  else
    show ( getxym x y m ) ++ " " ++ (getLinha (x+1) y m)

--           x     y     matriz
showMatriz :: Int-> Int-> [Int] -> String
showMatriz x y m =
  if (y >= tam-1) then
    (getLinha x y m) ++ "\n"
  else
    (getLinha x y m) ++ "\n" ++ (showMatriz x (y+1) m)

--              n      x      y      matriz   tem?
jaTemNaLinha :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaLinha n x y m =
  if x >= ( (tam) -1) then
    False
  else
    if n == getxym x y m then
      True
    else
      jaTemNaLinha n (x+1) y m

jaTemNaColuna :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaColuna n x y m =
  if y >= ( tam -1) then
    False
  else
    if n == getxym x y m then
      True
    else
      jaTemNaColuna n x (y+1) m


quantosVejoEsqParaDir :: Int -> Int -> Int-> Int -> [Int] -> Int
quantosVejoEsqParaDir x y iter maiorVisto m =
    if (x >= tam-1) then
      iter
    else
      if (getxym x y m) > maiorVisto then
        quantosVejoEsqParaDir (x+1) y (iter+1) (getxym x y m) m
      else
        iter

quantosVejoDirParaEsq :: Int -> Int -> Int-> Int -> [Int] -> Int
quantosVejoDirParaEsq x y iter maiorVisto m =
    if (x <=0) then
      iter
    else
      if (getxym x y m) > maiorVisto then
        quantosVejoDirParaEsq (x-1) y (iter+1) (getxym x y m) m
      else
        iter

{-
--                           x      y     iter  desejado   certo?
vejoCertoLinhaEsqParaDir :: Int -> Int -> Int-> [Int] -> Bool
vejoCertoLinhaEsqParaDir x y soma desejado =
  if (x >= tam-1) then
    True
  else
    if (iter > desejado) then
      False
    else
      vejoCertoLinhaEsqParaDir (x+1) y ()
      -}

main = do
  putStr( (showMatriz 0 0 matriz) )
  print( (jaTemNaColuna 0 0 0 matriz) )
  --print( (quantosVejoEsqParaDir 1 2 0 0 matriz))
  print( (quantosVejoDirParaEsq (tam-2) 1 0 0 matriz))
