import Control.Monad

{-
Matrizes são representadas em uma lista simples. São linearizadas,e acessadas
no estili x + y*width.

p é uma lista com os números possíveis para uma matriz, m é uma matriz, com
inclusive na volta dela, dizendo quandos prédios devem ser vistos.
r é a matriz de resultado, que se espera encontrar com a execução do programa.
estão sendo feito vários testes com a execução do programa.
'o' eh -1, que indica que um espaço não foi preenchido.
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

p5 = [1,2,3,4,5]
m5 = [0, e, 3, 3, e, e, 0,
      1, o, o, o, o, o, 3,
      4, o, o, o, o, o, 2,
      3, o, o, o, o, o, 3,
      2, o, o, o, o, o, e,
      e, o, o, o, o, o, 1,
      0, e, 2, 2, 2, 1, 0]

r5 = [0, e, 3, 3, e, e, 0,
      1, 5, 3, 1, 4, 2, 3,
      4, 1, 2, 3, 5, 4, 2,
      3, 3, 4, 5, 2, 1, 3,
      2, 4, 5, 2, 1, 3, e,
      e, 2, 1, 4, 3, 5, 1,
      0, e, 2, 2, 2, 1, 0]

p6 = [1,2,3,4,5]
m6 = [0, 1, 3, 3, 2, 3, 0,
      1, o, o, o, o, o, 3,
      4, o, o, o, o, o, 2,
      3, o, o, o, o, o, 3,
      2, o, o, o, o, o, 2,
      3, o, o, o, o, o, 1,
      0, 3, 2, 2, 2, 1, 0]

r6 = [0, 1, 3, 3, 2, 3, 0,
      1, 5, 3, 1, 4, 2, 3,
      4, 1, 2, 3, 5, 4, 2,
      3, 3, 4, 5, 2, 1, 3,
      2, 4, 5, 2, 1, 3, 2,
      3, 2, 1, 4, 3, 5, 1,
      0, 3, 2, 2, 2, 1, 0]

--e = 0 eh quando não informa a quantidade de prédios que devem ser vistos.

p7 = [1,2,3,4,5,6,7]
m7 = [0, e, 3, e, 4, 2, 4, e, 0,
      e, o, o, o, o, o, o, o, 3,
      e, o, o, o, o, o, o, o, 2,
      3, o, o, o, o, o, o, o, 5,
      5, o, o, o, o, o, o, o, e,
      4, o, o, o, o, o, o, o, e,
      e, o, o, o, o, o, o, o, 5,
      e, o, o, o, o, o, o, o, 4,
      0, 3, e, 3, e, 4, 3, 4, 0]
r7 = [0, e, 3, e, 4, 2, 4, e, 0,
      e, 7, 4, 3, 2, 6, 1, 5, 3,
      e, 4, 1, 2, 3, 7, 5, 6, 2,
      3, 1, 2, 7, 6, 5, 4, 3, 5,
      5, 2, 3, 5, 4, 1, 6, 7, e,
      4, 3, 5, 6, 1, 2, 7, 4, e,
      e, 6, 7, 1, 5, 4, 3, 2, 5,
      e, 5, 6, 4, 7, 3, 2, 1, 4,
      0, 3, e, 3, e, 4, 3, 4, 0]

p8 = [1, 2, 3, 4]
m8 = [d, e, e, e, e, 0,
      e, o, o, o, o, e,
      e, o, o, o, o, e,
      e, o, o, o, o, e,
      e, o, o, o, o, 2,
      0, e, e, e, 4, 0]
r8 = [d, e, e, e, e, 0,
      e, 2, 3, 1, 4, e,
      e, 1, 4, 2, 3, e,
      e, 4, 1, 3, 2, e,
      e, 3, 2, 4, 1, 2,
      0, e, e, e, 4, 0]

p9 = [1, 2, 3, 4]
m9 = [d, e, e, e, e, 0,
      3, o, o, o, o, 2,
      e, o, o, o, o, e,
      3, o, o, o, o, e,
      e, o, o, o, o, e,
      0, e, e, e, e, 0]
r9 = [d, e, e, e, e, 0,
      3, 1, 2, 4, 3, 2,
      e, 3, 4, 2, 1, e,
      3, 2, 1, 3, 4, e,
      e, 4, 3, 1, 2, e,
      0, e, e, e, e, 0]

p10 = [1, 2, 3, 4]
m10 = [d, e, e, e, e, 0,
       1, o, o, o, o, e,
       2, o, o, o, o, e,
       3, o, o, o, o, e,
       e, 1, o, o, o, e,
       0, e, e, e, e, 0]
r10 = [d, e, e, e, e, 0,
       1, 4, 1, 3, 2, e,
       2, 3, 2, 4, 1, e,
       3, 2, 3, 1, 4, e,
       e, 1, 4, 2, 3, e,
       0, e, e, e, e, 0]

p11 = [0, 1, 2, 3, 4]
m11 = [d, 3, 1, e, 2, 2, 0,
       1, o, o, o, o, o, e,
       e, o, o, o, o, o, e,
       2, o, o, o, o, o, 2,
       e, o, o, o, o, o, 4,
       e, o, o, o, o, o, e,
       0, 2, e, 2, e, e, 0]
r11 = [d, 3, 1, e, 2, 2, 0,
       1, 0, 4, 1, 3, 2, e,
       e, 2, 1, 3, 0, 4, e,
       2, 3, 2, 4, 1, 0, 2,
       e, 4, 3, 0, 2, 1, 4,
       e, 1, 0, 2, 4, 3, e,
       0, 2, e, 2, e, e, 0]

p12 = [1, 2, 3, 4, 5, 6]
m12 = [0, 2, 3, 2, 2, 1, 3, 0,
       5, o, o, o, o, o, o, 2,
       1, o, o, o, o, o, o, 3,
       3, o, o, o, o, o, o, 2,
       2, o, o, o, o, o, o, 1,
       4, o, o, o, o, o, o, 2,
       2, o, o, o, o, o, o, 2,
       0, 3, 1, 3, 2, 4, 2, 0]
r12 = [0, 2, 3, 2, 2, 1, 3, 0,
       5, 1, 3, 4, 5, 6, 2, 2,
       1, 6, 2, 3, 4, 5, 1, 3,
       3, 3, 5, 6, 1, 2, 4, 2,
       2, 5, 1, 2, 3, 4, 6, 1,
       4, 2, 4, 5, 6, 1, 3, 2,
       2, 4, 6, 1, 2, 3, 5, 2,
       0, 3, 1, 3, 2, 4, 2, 0]

p13 = [1, 2, 3, 4, 5, 6]
m13 = [0, 1, 2, 2, 2, 3, 3, 0,
       1, o, o, o, o, o, o, 5,
       2, o, o, o, o, o, o, 3,
       2, o, o, o, o, o, o, 1,
       2, o, o, o, o, o, o, 4,
       3, o, o, o, o, o, o, 4,
       2, o, o, o, o, o, o, 2,
       0, 3, 3, 2, 4, 1, 2, 0]
r13 = [0, 1, 2, 2, 2, 3, 3, 0,
       1, 6, 4, 5, 3, 2, 1, 5,
       2, 3, 1, 2, 6, 5, 4, 3,
       2, 5, 3, 4, 2, 1, 6, 1,
       2, 2, 6, 1, 5, 4, 3, 4,
       3, 1, 5, 6, 4, 3, 2, 4,
       2, 4, 2, 3, 1, 6, 5, 2,
       0, 3, 3, 2, 4, 1, 2, 0]

p325 = [0,1,2,3,4]
m325 = [0, e, 3, 1, e, 2, 0,
        e, o, o, o, o, o, 3,
        e, o, o, o, o, o, 1,
        e, o, o, o, o, o, e,
        e, o, o, o, o, o, 4,
        e, o, o, o, o, o, 4,
        0, e, 1, 2, 2, e, 0 ]
r325 = [0, e, 3, 1, e, 2, 0,
        e, 1, 0, 4, 3, 2, 3,
        e, 3, 2, 1, 0, 4, 1,
        e, 2, 1, 0, 4, 3, e,
        e, 4, 3, 2, 1, 0, 4,
        e, 0, 4, 3, 2, 1, 4,
        0, e, 1, 2, 2, e, 0 ]

p270 = [1,2,3,4,5,6]
m270 =[0, 3, 3, e, e, e, 2, 0,
       3, o, o, o, o, o, o, 2,
       e, o, o, o, o, o, o, 3,
       3, o, o, o, o, o, o, 1,
       2, o, o, o, o, o, o, 3,
       e, o, o, o, o, o, o, 4,
       1, o, o, o, o, o, o, 5,
       0, e, 2, 3, 5, 4, 4, 0]
r270=[0, 3, 3, e, e, e, 2, 0,
      3, 3, 2, 1, 4, 6, 5, 2,
      e, 5, 4, 3, 6, 2, 1, 3,
      3, 4, 3, 2, 5, 1, 6, 1,
      2, 2, 1, 6, 3, 5, 4, 3,
      e, 1, 6, 5, 2, 4, 3, 4,
      1, 6, 5, 4, 1, 3, 2, 5,
      0, e, 2, 3, 5, 4, 4, 0]

--tam = tamanhoLinha matriz
tam m = tamanhoLinha m

--maior possivel!!
mp :: [Int] -> Int
mp p = p!!( (length p) -1)

o = -1 -- indica que nao foi colocado nada em um slot
infinito = 999999999
inf = infinito
w = infinito
e = 0
d = 1 -- verificar diagonais
indo = True
voltando = False

-- retorna uma matriz similar a matriz passada, que auxilia na execução do
-- programa guardando o index da lista de números possíveis p/ cada posição (x,y)
criaMatrizV :: [Int] -> [Int]
criaMatrizV [] = []
criaMatrizV (a:b)
    | (a == o) = [0] ++ criaMatrizV b
    | otherwise = [-1] ++ criaMatrizV b

--retorna o tamanho da linha da matriz passada
tamanhoLinha :: [Int] -> Int -- eh soh uma raiz quadrada devolvendo Int
tamanhoLinha matrix = round (fromIntegral(length matrix) ** 0.5)

--retorna o elemento na posição (x,y) da matriz m
getxym :: Int -> Int -> [Int] -> Int
getxym x y m = m !! (x + y*(tam m))

--função ajuda na tarefa de imprimir uma matriz, retornando uma linha formatada
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

--retorna uma matriz pronta para imprimir na tela.
--           x     y     matriz
showMatriz :: Int-> Int-> [Int] -> String
showMatriz x y m =
    if (y >= (tam m)-1) then
        (getLinha x y m) ++ "\n"
    else
        (getLinha x y m) ++ "\n" ++ (showMatriz x (y+1) m)

--              n      x      y      matriz   tem?
jaTemNaLinha :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaLinha n x y m
    | (x == 0) = False
    | (n == getxym x y m) = True
    | otherwise = jaTemNaLinha n (x - 1) y m

jaTemNaColuna :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaColuna n x y m
    | (y == 0) = False
    | (n == getxym x y m) = True
    | otherwise = jaTemNaColuna n x (y - 1) m

jaTemNasDiagonais :: Int -> Int -> Int -> [Int] -> Bool
jaTemNasDiagonais n x y m
    | (y == 0) = False
    | (n == getxym x y m) = True
    | (x == y) && ((x + y) == (tam m) - 1) = (jaTemNaDiagonalPrincipal n (x - 1) (y - 1) m) || (jaTemNaDiagonalSecundaria n (x + 1) (y - 1) m)
    | (x == y) = jaTemNaDiagonalPrincipal n (x - 1) (y - 1) m
    | ((x + y) == (tam m) - 1) = jaTemNaDiagonalSecundaria n (x + 1) (y - 1) m

jaTemNaDiagonalPrincipal :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaDiagonalPrincipal n x y m
    | (y == 0) = False
    | (n == getxym x y m) = True
    | otherwise = jaTemNaDiagonalPrincipal n (x - 1) (y - 1) m

jaTemNaDiagonalSecundaria :: Int -> Int -> Int -> [Int] -> Bool
jaTemNaDiagonalSecundaria n x y m
    | (y == 0) = False
    | (n == getxym x y m) = True
    | otherwise = jaTemNaDiagonalSecundaria n (x + 1) (y - 1) m

insereNaPosicao :: Int -> Int -> [Int] -> [Int]
insereNaPosicao num 0 (a:b) = [num] ++ (a:b)
insereNaPosicao num pos (a:b) = [a] ++ insereNaPosicao num (pos - 1) b
insereNaPosicao num _ [] = [num]

removeDaPosicao :: Int -> [Int] -> [Int]
removeDaPosicao 0 (a:b) = b
removeDaPosicao pos (a:b) = [a] ++ removeDaPosicao (pos - 1) b
removeDaPosicao _ [] = []

setXY :: Int -> Int -> Int -> [Int] -> [Int]
setXY num x y m = insereNaPosicao num (x+y*(tam m)) (removeDaPosicao (x+y*(tam m)) m)

--iter guarda quantos foram vistos
--A funcao eh pensada para percorrer uma linha ou uma coluna no sentido
--informado por deslocX ou deslocY (um deles deve ser zero, o outro 1 ou -1)
--ateh o limite informado, e retorna quantos predios foi possivel ver daquele angulo
--ele para quando le um zero, mas a ideia eh ir preenchendo e verificando de maneira que nao comece lendo zero
quantosVejo :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> [Int] -> Int
quantosVejo x y iter maiorVisto deslocX deslocY limX limY m
    | ( x == limX || y == limY ) = iter -- resultado encontrado porque percorreu a sequencia inteira
    -- viu um predio maior e aumenta a contagem
    | (getxym x y m) > maiorVisto = quantosVejo (x+deslocX) (y+deslocY) (iter+1) (getxym x y m) deslocX deslocY limX limY m
    -- predio eh igual (0) dae continua lendo mas nao incrementa contagem
    | (getxym x y m) <= maiorVisto = quantosVejo (x+deslocX) (y+deslocY) (iter) maiorVisto deslocX deslocY limX limY m

--para um dado y, considerando que a linha está completamente preenchida, verifica
--se está sendo vista a quantidade certa nos dois sentidos.
linhaCerta :: Int-> [Int] -> Bool
linhaCerta y m
    | (getxym 0 y m == e) && (getxym ((tam m) - 1) y m == e) = True
    | (getxym 0 y m == e) = (getxym ((tam m)-1) y m) == quantosVejo ((tam m)-2) y 0 0 (-1) 0 0 inf m
    | (getxym ((tam m)-1) y m == e) = (getxym 0 y m) == quantosVejo 1 y 0 0 1 0 ((tam m)-1) inf m
    | otherwise = (((getxym ((tam m)-1) y m) == quantosVejo ((tam m)-2) y 0 0 (-1) 0 0 inf m) && ((getxym 0 y m) == quantosVejo 1 y 0 0 1 0 ((tam m)-1) inf m))

--similar à linhaCerta, função acima.
colunaCerta :: Int -> [Int] -> Bool
colunaCerta x m
    | (getxym x 0 m == e) && (getxym x ((tam m) - 1) m == e) = True
    | (getxym x 0 m == e) = (getxym x ((tam m) - 1) m) == quantosVejo x ((tam m) - 2) 0 0 0 (-1) inf 0 m
    | (getxym x ((tam m) - 1) m == e) = (getxym x 0 m) == quantosVejo x 1 0 0 0 1 inf ((tam m) - 1) m
    | otherwise = (((getxym x ((tam m) - 1) m) == quantosVejo x ((tam m) - 2) 0 0 0 (-1) inf 0 m) && ((getxym x 0 m) == quantosVejo x 1 0 0 0 1 inf ((tam m) - 1) m))

{-}
--essa função é crucial no programa. Ela é chamada para a última posição que se
tentou preencher. Note que se tenta preencher da esquerda para a direita, e de
cima para baixo. Dessa forma, a função vejoCerto verifica se da esquerda para a
direita, está sendo vista uma quantidade menor ou igual ao limite de prédios.
Ué, mas e da direita para a esquerda? Ela verifica daí só quando a linha tiver
sido completamente preenchida, e daí se verifica se as quantidades são exatamente
iguais as desejadas, não mais ">=".
Isso porque se quer saber se o número na posição (x,y) é um chute coerente do que
pode vir a ser o resultado.
-}
vejoCerto :: Int -> Int -> [Int] -> Bool
vejoCerto x y m =
    (((getxym 0 y m) >= quantosVejo 1 y 0 0 1 0 ((tam m)-1) inf m) || (getxym 0 y m) == e) && --esqParaDir
    --dirParaEsq -- equivalenca ( se p -> q) para (not p || q), ou seja, se x==tam-1 então linha deve ser valida. pois antes nao dah pra saber ao certo
    ((not (x == ((tam m)-2)) ) || linhaCerta y m) &&
    (((getxym x 0 m) >= quantosVejo x 1 0 0 0 1 inf ((tam m)-1) m) || (getxym x 0 m) == e) && --cimaParaBaixo
    -- baixoPraCima equivalencia tambem.. se y==tam-1 então verificar de baixo pra cima
    ((not (y == ((tam m)-2))) || colunaCerta x m || (getxym x ((tam m) - 1)) m == e)

-- função para testar a função vejoCerto durante o desenvolvimento.
testaVejoCerto :: Int -> Int -> [Int] -> IO()
testaVejoCerto x y m = do
    putStr( "\nEsqPAraDir: " ++ show(((getxym 0 y m) >= quantosVejo 1 y 0 0 1 0 ((tam m)-1) inf m)) )
    putStr( "\nDirParaEsq: " ++ show((not (x == ((tam m)-2)) ) || ((getxym ((tam m)-1)    y    m)  >= quantosVejo ((tam m)-2) y 0 0 (-1) 0 0 inf m)))
    putStr( "\ncimapBaixo: " ++ show((getxym x 0 m) >= quantosVejo x 1 0 0 0 1 inf ((tam m)-1)  m))
    putStr( "\nbaixopCima: " ++ show((not (y == ((tam m)-2)) ) || ((getxym x ((tam m)-1) m) >= quantosVejo x ((tam m)-2) 0 0 0 (-1) inf 0 m)))
-- função para testar a função vejoCerto durante o desenvolvimento.
testaQtd :: Int -> Int -> [Int] -> IO ()
testaQtd x y m = do
    putStr( "\nesq p/ dir:" ++ show(quantosVejo 1 y 0 0 1 0 ((tam m)-1) inf m)) --esq para dir
    putStr( "\ndir p/ esq:" ++ show(quantosVejo ((tam m)-2) y 0 0 (-1) 0 0 inf m) ) --dir para esq
    putStr( "\ncima p/ baixo:" ++ show(quantosVejo x 1 0 0 0 1 inf ((tam m)-1)  m)) --cima para baixo
    putStr( "\nbaixo p/ cima:" ++ show(quantosVejo x ((tam m)-2) 0 0 0 (-1) inf 0 m) ) --baixo para cima

{-
função muito importante, tahOk, testa se uma posição (x,y) está no caminho certo.
Veja o comentário sobre a função 'vejoCerto', pois as verificações são justamente
o que se faz na vejoCerto (ver se quantidade de prédios vistos é coerente), e
ver se o último número se repete na sua linha, coluna, e talvez na sua diagonal.
-}
tahOk :: Int -> Int -> [Int] -> Bool
tahOk x y m
    | (getxym 0 0 m == d) && ((x == y) || (x + y == (tam m) - 1)) = (vejoCerto x y m) && (not (jaTemNaLinha (getxym x y m) x y (setXY (o) x y m) ) ) && (not (jaTemNaColuna (getxym x y m) x y (setXY (o) x y m)))
        && (not (jaTemNasDiagonais (getxym x y m) x y (setXY (o) x y m)))
    | otherwise = (vejoCerto x y m) && (not (jaTemNaLinha (getxym x y m) x y (setXY (o) x y m))) && (not (jaTemNaColuna (getxym x y m) x y (setXY (o) x y m)) )
    -- esse set de -1 (o) eh porque se jah tiver o numero desejado na posição, ele vai considerar uma repetição.
    -- Então temos que passar uma matriz que não tem o numero desejado na posição alvo

-- as próximas funções caminham no x e no y, pegando o próximo e o anterior, considerando
-- o tamanho da matriz, e suas bordas que contém informação extra.
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

-- cria uma matriz do tamanho da passada como parâmetro, repleta de zeros
zeros :: [Int] -> [Int]
zeros [] = []
zeros (a:b) = [0] ++ (zeros b)

{-
a função resolve é o coração do programa. Ela recebe uma matriz, vai modificando
essa matriz e a passando para suas chamadas recursivas. Ela tem alguns casos, comentados
no corpo da função
-}
resolve :: Int-> Int -> Int -> [Int] -> [Int] -> [Int] -> Bool -> [Int]
resolve k x y m v p d -- k= limiteDaRecursao, x, y, m, v=matrizGuardaIndexNoVetorDePossiveis, p=listaDeNumerosPossiveis[100% constante] d=RepetiçãoEhProibidaNasDiagonais
    | k <=0 = m -- ESCOLHA AQUI v OU m para ser retornada (e exibida) ao atingir iteração k
    | y < 0 = m -- foi sinalizado y = -1 -> encerrar execução .. na vdd nao tah parando mas era a ideia parar caso y==-1
    -- Estava indo e encontrou posicao que na pode mudar, vai para a proxima
    | (getxym x y v == -1 && d == indo) = resolve (k-1) (nextX x m) (nextY x y m) m v p indo
    -- Estava voltando e encontrou posicao que nao pode mudar, volta mais uma posicao
    | (getxym x y v == -1 && d == voltando) = resolve (k-1) (backX x m) (backY x y) m v p voltando
    -- nenhum encaixa aki, mude o anterior (mp pega o ultimo elemento -> o Maior Possível ié o Maior da lista de Possívels)
    | (getxym x y m) >= (mp p) = resolve (k-1) (backX x m) (backY x y) (setXY o x y m) (setXY 0 x y v) p voltando
    --tudo certo (tahOk!), substitui e bola pra frente
    | tahOk x y (setXY (p!!(getxym x y v)) x y m ) = resolve (k-1) (nextX x m) (nextY x y m) (setXY (p!!(getxym x y v)) x y m ) (setXY ((getxym x y v) +1) x y v ) p indo
    -- não tahOk, tente o próximo número na lista de números possíveis
    | not (tahOk x y (setXY (p!!(getxym x y v)) x y m )) = resolve (k-1) x y (setXY (p!!(getxym x y v)) x y m ) (setXY (( (getxym x y v) +1) ) x y v ) p indo

-- função auxiliar para testar a tahOk durante o desenvolvimento
testahOk :: Int->Int->[Int]->IO ()
testahOk x y m = do
    putStr( "numero: "++show(getxym x y m)++" posicao: ("++show(x)++","++show(y)++")\n")
    putStr( "tahOk: " ++ show(tahOk x y m) )
    putStr( "\nvejo certo:"++   show(vejoCerto x y m) )
    -- esse set de -1(o) eh porque se jah tiver o numero desejado na posição, ele vai considerar uma repetição.
    -- Então temos que passar uma matriz que não tem o numero desejado na posição alvo
    putStr( "\njah tem na linha:"++    show( (jaTemNaLinha (getxym x y m) 1 y (setXY (o) x y m))))
    putStr( "\njah tem na coluna:"++   show( (jaTemNaColuna (getxym x y m) x 1 (setXY (o) x y m))))

-- função sagaz que resolve a matriz parando na iteração 'ini' até parando na iteração 'fim'
-- imprimindo assim o progrsso na resolução. Muito útil para testes
resolveEntre :: Int->Int->[Int]->[Int]-> IO ()
resolveEntre ini fim p m = forM_ [ini..fim] $ \i ->
    putStrLn ("step " ++ show i ++"\n"++(showMatriz 0 0 (resolve i 1 1 m (criaMatrizV m) p indo) ))

lim = 5200000 -- limite da recursão

--resolvida retorna a matriz resolvida (ou tenta)
resolvida :: [Int] -> [Int] -> [Int]
resolvida p m = (resolve lim 1 1 m (criaMatrizV m) p indo)

main = do
  --putStr(showMatriz 0 0 (insereNaPosicao2 (-8) 7 m5) ++ "\n")
    putStr("Assert resolve m0: " ++ show( resolvida p0 m0 == r0 )++"\n")
    putStr("Assert resolve m1: " ++ show( resolvida p1 m1 == r1 )++"\n")
    putStr("Assert resolve m2: " ++ show( resolvida p2 m2 == r2 )++"\n")
    putStr("Assert resolve m3: " ++ show( resolvida p3 m3 == r3 )++"\n")
    putStr("Assert resolve m4: " ++ show( resolvida p4 m4 == r4 )++"\n")
    putStr("Assert resolve m5: " ++ show( resolvida p5 m5 == r5 )++"\n")
    putStr("Assert resolve m6: " ++ show( resolvida p6 m6 == r6 )++"\n")
    putStr("Assert resolve m8: " ++ show( resolvida p8 m8 == r8 )++"\n")
    putStr("Assert resolve m9: " ++ show( resolvida p9 m9 == r9 )++"\n")
    putStr("Assert resolve m10: " ++ show( resolvida p10 m10 == r10 )++"\n")
    putStr("Assert resolve m11: " ++ show( resolvida p11 m11 == r11 )++"\n")
    --putStr("Assert resolve m12: " ++ show( resolvida p12 m12 == r12 )++"\n")
    --putStr("Assert resolve m13: " ++ show( resolvida p13 m13 == r13 )++"\n")

    --substitua p11 e m11 por uma lista de possíveis e uma matriz que queiras ver o resultado.
    putStr("Assert resolve m325: " ++ show( resolvida p325 m325 == r325 )++"\n")
    resolveEntre lim lim p325 m325
    putStr("Assert resolve m270: " ++ show( resolvida p270 m270 == r270 )++"\n")
    resolveEntre lim lim p270 m270

    --alguns testes antigos:
    --putStr( "\nresult: \n"++(showMatriz 0 0 t3) )
    --testahOk 3 2 t3
    --testaQtd 3 2 t3
    --testaVejoCerto 3 2 t3
