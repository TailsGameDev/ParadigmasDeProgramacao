data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 52 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x
    | (n == x) = True
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

alturaElemento :: Arvore -> Int -> Int -> Int
alturaElemento Null _ _ = -1
alturaElemento (No n esq dir) num prof =
  if (num == n) then
    maximo ( maximo prof (alturaElemento esq num (prof+1) ) ) (alturaElemento dir num (prof+1))
  else
    maximo ( (alturaElemento esq num (prof+1) ) ) (alturaElemento dir num (prof+1))

maiorProfundidadeElemento :: Arvore -> Int -> Int
maiorProfundidadeElemento arv num = alturaElemento arv num 0

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

main = do print ( (maiorProfundidadeElemento minhaArvore 33) )

{-
main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))
-}
