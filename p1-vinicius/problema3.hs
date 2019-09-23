data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 13 (No 11 (No 12 Null Null) (No 2 Null Null)) (No 56 (No 3 Null Null) (No 7 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x
    | (n == x) = True
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)



----------------- inicio 3A ------------------------

alturaElemento :: Arvore -> Int -> Int -> Int
alturaElemento Null _ _ = -1
alturaElemento (No n esq dir) num prof =
  if (num == n) then
    maximo ( maximo prof (alturaElemento esq num (prof+1) ) ) (alturaElemento dir num (prof+1))
  else
    maximo ( (alturaElemento esq num (prof+1) ) ) (alturaElemento dir num (prof+1))

maiorProfundidadeElemento :: Arvore -> Int -> Int
maiorProfundidadeElemento arv num = alturaElemento arv num 0

----------------- final  3A ------------------------

----------------- inicio 3B ------------------------

veprimo :: Int->Int-> Bool
veprimo _ 1 = True --eh primo!
veprimo n i =
  if ( (mod n i)==0 ) then
    False --"nao primo"
  else
    veprimo n (i-1)

listaFolhas :: Arvore -> [Int] -> [Int]
listaFolhas Null list = list
listaFolhas (No n Null Null) list = [n]
listaFolhas (No n esq dir) list = (listaFolhas esq list) ++ (listaFolhas dir list)

folhasPrimos :: Arvore -> [Int]
folhasPrimos arv = [ x | x <- listaFolhas arv [] , (veprimo x (div x 2) ) ]
----------------- final  3B ------------------------

----------------- inicio 3C ------------------------

ocorrenciasElemento ::  Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) i =
  if ( n == i ) then
    1 + (ocorrenciasElemento esq i) + (ocorrenciasElemento dir i)
  else
    (ocorrenciasElemento esq i) + (ocorrenciasElemento dir i)

veSeRepeteNVezes :: Arvore -> Int -> Int -> Int --retorna 1 se ocorre n vezes, se n retorna 0
veSeRepeteNVezes arv num qtd =
  if (ocorrenciasElemento num) >= qtd then
    1
  else
    0

elementos ::  Arvore -> [Int]
elementos Null = []
elementos (No n esq dir) = [n] ++ (elementos esq) ++ (elementos dir)

contem :: Int -> [Int] -> Bool
contem _ [] = False
contem num (a:b) =
  if a == num then
    True
  else
    contem num b


semRepetidos :: [Int] -> [Int]
semRepetidos [] = []
semRepetidos (a:b) =
  if contem a b then
    semRepetidos b
  else
    [a] ++ semRepetidos b

repetElem :: Arvore -> Int -> [Int] -> Int -> Int
repetElem arv num (a:b) itera = veSeRepeteNVezes arv num 



elementosRepetidos :: Arvore -> Int -> Int
elementosRepetidos


----------------- final  3C ------------------------


limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

maximo :: Int -> Int -> Int
maximo x y | (x > y) = x
          | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup
minimoElemento (No n esq dir) =
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))



main = do print ("Questao 3 A) Maior profundidade do elemento escolhido")
          print ( (maiorProfundidadeElemento minhaArvore 33) ) -- questo A
          print ("Questao 3 B) lista de folhas:")
          print ( (listaFolhas minhaArvore []) )
          print ("Questao 3 B) lista de folhas primas:")
          print ( (folhasPrimos minhaArvore) )
          print ( (semRepetidos [2,3,4,5,4,3]) )

{-
main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))
-}
