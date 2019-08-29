{-
Motifique  o  arquivoarvore.hs(dispon ́ıvel  no  Moodle)  de  forma  a  adicionar
  novas  opera ̧c ̃oes  a  nossa ́arvore:
  A:Crie uma fun ̧c ̃ao com a seguinte
  assinatura:
  ocorrenciasElemento ::  Arvore -> Int -> Int, aqual recebe um n ́umero
   e deve retornar a quantidade de ocorrˆencias dele na  ́arvore.
   B:Crie  uma fun ̧c ̃ao  com  a  seguinte  assinatura:
    maioresQueElemento ::  Arvore -> Int -> Int,  aqual recebe um n ́umero
     e deve retornar a quantidade de n ́umeros maioresque ele na  ́arvore.
 C:Crie  uma  fun ̧c ̃ao  com  a  seguinte  assinatura:
 mediaElementos ::  Arvore -> Float,  a  qual  deveretornar a m ́edia dos n ́
 umeros na  ́arvore.  DICA: utilize a fun ̧c ̃aofromIntegralpara converter
  umtipo inteiro para um tipo compat ́ıvel com o operador de divis ̃ao/
  D:Crie uma fun ̧c ̃ao com a seguinte assinatura:
  quantidade ::  Arvore -> Int, a qual deve retornara quantidade de
   elementos na  ́arvore.E:Crie uma fun ̧c ̃ao com a seguinte assinatura:
   elementos ::  Arvore -> [Int], a qual deve retornaruma lista com
   todos os elementos na  ́arvore.
-}

data Arvore = Null | No Int Arvore Arvore

menorNumero = -9001

mediaElementos ::  Arvore -> Float
mediaElementos Null = 0
mediaElementos a = (fromIntegral (somaElementos a)) / (fromIntegral (maioresQueElemento a menorNumero ))

maioresQueElemento ::  Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) i =
  if ( n > i ) then
    1 + (maioresQueElemento esq i) + (maioresQueElemento dir i)
  else
    (maioresQueElemento esq i) + (maioresQueElemento dir i)

ocorrenciasElemento ::  Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) i =
  if ( n == i ) then
    1 + (ocorrenciasElemento esq i) + (ocorrenciasElemento dir i)
  else
    (ocorrenciasElemento esq i) + (ocorrenciasElemento dir i)

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 55 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x
    | (n == x) = True
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup
minimoElemento (No n esq dir) =
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))

main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))
          print( (ocorrenciasElemento minhaArvore 55) )
          print( (maioresQueElemento minhaArvore 56) )
          print( (mediaElementos minhaArvore) )
