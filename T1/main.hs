import Control.Monad
o = -1 -- indica que nao foi colocado nada em um slot

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

p0 = [1]
m0 = [0, 1, 0,
      1, o, 1,
      0, 1, 0]
r0 = [0, 1, 0,
      1, 1, 1,
      0, 1, 0]

p1 = [1,2]
m1 = [0, 2, 1, 0,
      2, o, o, 1,
      1, o, o, 2,
      0, 1, 2, 0]
r1 = [0, 2, 1, 0,
      2, 1, 2, 1,
      1, 2, 1, 2,
      0, 1, 2, 0]

p2 = [1,2]
m2 = [0, 2, 1, 0,
      2, o, o, 1,
      1, o, o, 2,
      0, 1, 2, 0]
r2 = [0, 2, 1, 0,
      2, 1, 2, 1,
      1, 2, 1, 2,
      0, 1, 2, 0]

p3 = [1,2,3]
m3 = [0, 2, 2, 1, 0,
      3, o, o, o, 1,
      1, o, o, o, 2,
      2, o, o, o, 2,
      0, 2, 1, 3, 0]
r3 = [0, 2, 2, 1, 0,
      3, 1, 2, 3, 1,
      1, 3, 1, 2, 2,
      2, 2, 3, 1, 2,
      0, 2, 1, 3, 0]
t3 = [0, 2, 2, 1, 0,
      3, 1, 2, 3, 1,
      1, 3, 1, 2, 2,
      2, o, o, o, 2,
      0, 2, 1, 3, 0]


p4 = [0,1,2,3]
m4 = [0, 2, 2, 1, 2, 0,
      2, o, o, o, o, 2,
      2, o, o, o, o, 2,
      3, o, o, o, o, 1,
      1, o, o, o, o, 3,
      0, 1, 2, 3, 1, 0]
r4 = [0, 2, 2, 1, 2, 0,
      2, 0, 1, 3, 2, 2,
      2, 2, 3, 0, 1, 2,
      3, 1, 0, 2, 3, 1,
      1, 3, 2, 1, 0, 3,
      0, 1, 2, 3, 1, 0]

--tam = tamanhoLinha matriz
tam m = tamanhoLinha m

--maior possivel!!
mp :: [Int] -> Int
mp p = p!!( (length p) -1)

infinito = 999999999
inf = infinito
w = infinito

tamanhoLinha :: [Int] -> Int -- eh soh uma raiz quadrada devolvendo Int
tamanhoLinha matrix = round (fromIntegral(length matrix) **0.5)

getxym :: Int -> Int -> [Int] -> Int
getxym x y m = m !! (x + y*(tam m))

--           x     y     matriz
getLinha :: Int -> Int -> [Int] -> String
getLinha x y m =
  if (x >= (tam m) -1) then
    " " ++ show ( getxym x y m )
  else
    if ( getxym x y m ) < 0 then
      show ( getxym x y m ) ++ " " ++ (getLinha (x+1) y m)
    else
      " " ++ show (getxym x y m ) ++ " " ++ (getLinha (x+1) y m)
--           x     y     matriz
showMatriz :: Int-> Int-> [Int] -> String
showMatriz x y m =
  if (y >= (tam m)-1) then
    (getLinha x y m) ++ "\n"
  else
    (getLinha x y m) ++ "\n" ++ (showMatriz x (y+1) m)

--              n      x      y      matriz   tem?
jaTemNaLinha :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaLinha n x y m =
  if x >= ( (tam m) -1) then
    False
  else
    if n == getxym x y m then
      True
    else
      jaTemNaLinha n (x+1) y m

jaTemNaColuna :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaColuna n x y m =
  if y >= ( (tam m) -1) then
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
setXY num x y m = insereNaPosicao num 0 (x+y*(tam m)) (removeDaPosicao 0 (x+y*(tam m)) m)

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
  | (getxym x y m) <= maiorVisto = -- predio eh igual (0) dae continua lendo mas nao incrementa contagem
      quantosVejo (x+deslocX) (y+deslocY)  (iter)    maiorVisto   deslocX deslocY limX limY m
  -- | otherwise = iter --resultado encontrado por que o predio eh menor que o anterior


vejoCerto :: Int -> Int -> [Int] -> Bool
vejoCerto x y m =
  ((getxym    0       y    m) >=                                     quantosVejo    1         y      0 0   1    0   ((tam m)-1)   inf      m) && --esqParaDir
  --dirParaEsq -- equivalenca ( se p -> q) para (not p || q), ou seja, se x==tam-1 então linha deve ser valida. pois antes nao dah pra saber ao certo
  (( not (x == ((tam m)-2)) ) || ((getxym ((tam m)-1)    y    m)  >= quantosVejo ((tam m)-2)  y      0 0 (-1)   0      0          inf      m) ) &&
  ((getxym    x       0    m) >=                                     quantosVejo    x         1      0 0   0    1     inf     ((tam m)-1)  m) && --cimaParaBaixo
  --baixoPraCima equivalencia tambem.. se y==tam-1 então verificar de baixo pra cima
  (( not (y == ((tam m)-2)) ) || ((getxym    x    ((tam m)-1) m)  >= quantosVejo    x    ((tam m)-2) 0 0   0  (-1)    inf          0       m) )

testaVejoCerto :: Int -> Int -> [Int] -> IO()
testaVejoCerto x y m = do
  putStr( "\nEsqPAraDir: "++show(((getxym   0       y    m) >=                                     quantosVejo    1         y      0 0   1    0   ((tam m)-1)   inf      m)) )
  putStr( "\nDirParaEsq: "++show(( not (x == ((tam m)-2)) ) || ((getxym ((tam m)-1)    y    m)  >= quantosVejo ((tam m)-2)  y      0 0 (-1)   0      0          inf      m) ) )
  putStr( "\ncimapBaixo: "++show((getxym    x       0    m) >=                                     quantosVejo    x         1      0 0   0    1     inf     ((tam m)-1)  m))
  putStr( "\nbaixopCima: "++show(( not (y == ((tam m)-2)) ) || ((getxym    x    ((tam m)-1) m)  >= quantosVejo    x    ((tam m)-2) 0 0   0  (-1)    inf          0       m) ))

testaQtd :: Int->Int->[Int]->IO ()
testaQtd x y m = do
  putStr( "\nesq p/ dir:"++   show(quantosVejo    1         y      0 0   1    0  ((tam m)-1)   inf      m) ) --esq para dir
  putStr( "\ndir p/ esq:"++   show(quantosVejo ((tam m)-2)  y      0 0 (-1)   0      0         inf      m) ) --dir para esq
  putStr( "\ncima p/ baixo:"++show(quantosVejo    x         1      0 0   0    1     inf    ((tam m)-1)  m) ) --cima para baixo
  putStr( "\nbaixo p/ cima:"++show(quantosVejo    x    ((tam m)-2) 0 0   0  (-1)    inf         0       m) ) --baixo para cima

tahOk :: Int -> Int -> [Int] -> Bool
tahOk x y m = (vejoCerto x y m) && (not (jaTemNaLinha (getxym x y m) 1 y (setXY (o) x y m) ) ) && (not (jaTemNaColuna (getxym x y m) x 1 (setXY (o) x y m)) )
-- esse set de -1 eh porque se jah tiver o numero desejado na posição, ele vai considerar uma repetição.
-- Então temos que passar uma matriz que não tem o numero desejado na posição alvo

backX :: Int -> [Int]-> Int
backX x m =
  if x <= 1 then
    (tam m)-2
  else
    x-1

nextX :: Int -> [Int]-> Int
nextX x m =
  if x >= ((tam m)-2) then
    1
  else
    x+1

backY :: Int -> Int -> Int
backY x y
  | x <= 1 && y >= 2 = y-1
  | x <= 1 && y < 2 = -1 --isso seria um erro: quer voltar mas tah no inicio
  | otherwise = y

nextY :: Int -> Int -> [Int] -> Int
nextY x y m
  | x >= ((tam m)-2) && y <= (tam m)-3 = y+1
  | x >= ((tam m)-2) && y > (tam m)-3 = -1 --isso deve ser gatilho para encerrar a execução
  | otherwise = y

zeros :: [Int] -> [Int]
zeros [] = []
zeros (a:b) = [0] ++ (zeros b)

resolve :: Int-> Int -> Int -> [Int] -> [Int] -> [Int] -> [Int]
resolve k x y m v p -- k= limiteDaRecursao, x, y, m, v=matrizGuardaIndexNoVetorDePossiveis, p=listaDeNumerosPossiveis[100% constante]
  | k <=0 = v
  | y < 0 = m -- foi sinalizado y = -1 -> encerrar execução .. na vdd nao tah parando mas era a ideia
    --tudo certo, vamo pro proximo
    -- nenhum encaixa aki, mude o anterior
  | (getxym x y m) >= (mp p) = --mp pega o ultimo elemento -> o maior possível
    resolve (k-1) (backX x m) (backY x y)          (setXY o x y m)                 (setXY 0 x y v) p
  --tudo certo, substitui e bola pra frente
  | tahOk x y (setXY (p!!(getxym x y v)) x y m ) =
    resolve (k-1) (nextX x m) (nextY x y m) (setXY (p!!(getxym x y v)) x y m ) (setXY ((getxym x y v) +1) x y v ) p
    -- tenta o proximo numero aki
  | not (tahOk x y (setXY (p!!(getxym x y v)) x y m )) =
    resolve (k-1)    x         y        (setXY (p!!(getxym x y v)) x y m ) (setXY (( (getxym x y v) +1) ) x y v ) p

testahOk :: Int->Int->[Int]->IO ()
testahOk x y m = do
  putStr( "numero: "++show(getxym x y m)++" posicao: ("++show(x)++","++show(y)++")\n")
  putStr( "tahOk: " ++ show(tahOk x y m) )
  putStr( "\nvejo certo:"++   show(vejoCerto x y m) )
  -- esse set de -1(o) eh porque se jah tiver o numero desejado na posição, ele vai considerar uma repetição.
  -- Então temos que passar uma matriz que não tem o numero desejado na posição alvo
  putStr( "\njah tem na linha:"++    show( (jaTemNaLinha (getxym x y m) 1 y (setXY (o) x y m) ) ) )
  putStr( "\njah tem na coluna:"++   show( (jaTemNaColuna (getxym x y m) x 1 (setXY (o) x y m)) ) )


resolveEntre :: Int->Int->[Int]->[Int]-> IO ()
resolveEntre ini fim p m = forM_ [ini..fim] $ \i ->
         putStrLn ("step " ++ show i ++"\n"++(showMatriz 0 0 (resolve i 1 1 m (zeros m) p) ))

lim = 5000 -- limite da recursão

--resolvida retorna a matriz resolvida (ou tenta)
resolvida :: [Int] -> [Int] -> [Int]
resolvida p m = (resolve lim 1 1 m (zeros m) p)

main = do
  putStr("Assert resolve m0: " ++ show( resolvida p0 m0 == r0 )++"\n")
  putStr("Assert resolve m1: " ++ show( resolvida p1 m1 == r1 )++"\n")
  putStr("Assert resolve m2: " ++ show( resolvida p2 m2 == r2 )++"\n")
  putStr("Assert resolve m3: " ++ show( resolvida p3 m3 == r3 )++"\n")
  putStr("Assert resolve m4: " ++ show( resolvida p4 m4 == r4 )++"\n")
  --putStr( "inicial: \n"++(showMatriz 0 0 m3) )
  --putStr( "\nresult: \n"++(showMatriz 0 0 r3) )
  --resolveEntre 20 30 p3 m3
  --putStr( "\nresult: \n"++(showMatriz 0 0 t3) )
  --testahOk 3 2 t3
  --testaQtd 3 2 t3
  --testaVejoCerto 3 2 t3
