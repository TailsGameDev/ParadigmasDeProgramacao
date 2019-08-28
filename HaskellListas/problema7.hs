alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 4.0)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getNota :: (Int, String, Float) -> Float
getNota (a,b,c) = c

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: Eq t => [t] -> [t] -> [(t,t)]
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2, b /= a]
--estah gerando pares repetidos soh que mudando a ordem

aprovado :: (Int, String, Float) -> Bool
aprovado (i, nome, media) = media >= 6

aprovados ::  [(Int, String, Float)] -> [String]
aprovados lista =  ( map getNome (filter (aprovado) lista) )

aprovados2 ::  [(Int, String, Float)] -> [String]
aprovados2 [] = []
--aprovados2 [ (i,nome,media) ] = [b | b <- [nome], media>=6 ]--, media >=6 ]
aprovados2 lista = [ (getNome b) | b <- lista, (getNota b) >= 6]

{-
aprovados2 [] = []
aprovados2 ( (i,nome,media) : b ) =
  if ( media >= 6 ) then
    nome : (aprovados2 b)
  else
    aprovados2 b
-}

main = do
    print (gerarPares alunos alunos)
    --print (gerarPares alunos)
