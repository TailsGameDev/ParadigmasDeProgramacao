
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

possiveis = [1,2]


matriz = [0, 2, 1, 0,
          2, 2, 1, 1,
          1, 0, 0, 2,
          0, 1, 2, 0]
{-
matriz = [0, 0, 0, 0, 0,
          0, 1, 2, 3, 0,
          0, 3, 1, 2, 0,
          0, 2, 3, 1, 0,
          0, 0, 0, 0, 0]
-}
tam = tamanhoLinha matriz

infinito = 999999999
inf = infinito
w = infinito

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


removeDaPosicao :: Int -> Int -> [Int] -> [Int]
removeDaPosicao i pos (a:b) =
  if i==pos then
    b
  else
    [a] ++ (removeDaPosicao (i+1) pos b)

insereNaPosicao :: Int -> Int -> Int -> [Int] -> [Int]
insereNaPosicao num i pos (a:b) =
  if i==(pos-1) then
    [a] ++ [num] ++ b
  else
    [a] ++ (insereNaPosicao num (i+1) pos b)

setXY :: Int -> Int -> Int -> [Int] -> [Int]
setXY num x y m = insereNaPosicao num 0 (x+y*tam) (removeDaPosicao 0 (x+y*tam) m)

--iter guarda quantos foram vistos
--A funcao eh pensada para percorrer uma linha ou uma coluna no sentido
--informado por deslocX ou deslocY (um deles deve ser zero, o outro 1 ou -1)
--ateh o limite informado, e retorna quantos predios foi possivel ver daquele angulo
--ele para quando le um zero, mas a ideia eh ir preenchendo e verificando de maneira que nao comece lendo zero
quantosVejo :: Int->Int->Int->Int-> Int->Int->Int->Int-> [Int] -> Int
quantosVejo x y iter maiorVisto deslocX deslocY limX limY m
  | ( x == limX || y == limY ) =
    iter -- resultado encontrado porque percorreu a sequencia inteira
  | (getxym x y m) > maiorVisto = -- viu um predio maior e aumenta a contagem
      quantosVejo (x+deslocX) (y+deslocY) (iter+1) (getxym x y m) deslocX deslocY limX limY m
  | (getxym x y m) == maiorVisto = -- predio eh igual (0) dae continua lendo mas nao incrementa contagem
      quantosVejo (x+deslocX) (y+deslocY)  (iter)  (getxym x y m) deslocX deslocY limX limY m
  | otherwise = iter --resultado encontrado por que o predio eh menor que o anterior


vejoCerto :: Int -> Int -> [Int] -> Bool
vejoCerto x y m =
  ((getxym    0       y    m) >= quantosVejo    1       y    0 0   1    0   (tam-1)   inf    m) && --esqParaDir
  ((getxym (tam-1)    y    m) >= quantosVejo (tam-2)    y    0 0 (-1)   0      0      inf    m) && --dirParaEsq
  ((getxym    x       0    m) >= quantosVejo    x       1    0 0   0    1     inf   (tam-1)  m) && --cimaParaBaixo
  ((getxym    x    (tam-1) m) >= quantosVejo    x    (tam-2) 0 0   0  (-1)    inf      0     m) --baixoPraCima

testaQtd :: Int->Int->[Int]->IO ()
testaQtd x y m = do
  putStr( "\nesq p/ dir:"++   show(quantosVejo    1       y    0 0   1    0   (tam-1)   inf    matriz) ) --esq para dir
  putStr( "\ndir p/ esq:"++   show(quantosVejo (tam-2)    y    0 0 (-1)   0      0      inf    matriz) ) --dir para esq
  putStr( "\ncima p/ baixo:"++show(quantosVejo    x       1    0 0   0    1     inf   (tam-1)  matriz) ) --cima para baixo
  putStr( "\nbaixo p/ cima:"++show(quantosVejo    x    (tam-2) 0 0   0  (-1)    inf      0     matriz) ) --baixo para cima

tahOk :: Int -> Int -> [Int] -> Bool
tahOk x y m = (vejoCerto x y m) && (not (jaTemNaLinha (getxym x y m) x y m) ) && (not (jaTemNaColuna (getxym x y m) x y m) )

nextX :: Int -> Int
nextX x =
  if x >= (tam-2) then
    1
  else
    x+1

nextY :: Int -> Int -> Int
nextY x y
  | x >= (tam-2) && y <= tam-3 = y+1
  | x >= (tam-2) && y > tam-3 = -1 --isso deve ser gatilho para encerrar a execução
  | otherwise = y

--resolve x y m =
--  | tahOk

main = do
  putStr( (showMatriz 0 0 matriz) )
  print( (jaTemNaColuna 0 0 0 matriz) )
  print( (tahOk 1 2 matriz) )
  --print( (vejoCerto 2 1 matriz) )
  --testaQtd 2 1 matriz
