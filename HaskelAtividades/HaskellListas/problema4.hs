{-
Crie uma fun ̧c ̃ao com assinaturadiferencaMaiorMenor ::  [Int] -> Int,
 a qual recebe uma lista deInt e retorna a diferen ̧ca
 entre o maior e o menor elemento da lista.  Retorne 0 caso
 a lista for vazia.N ̃aoutilizenenhuma fun ̧c ̃ao pronta do Haskell
  para realizar esta tarefa.
-}

maior ::  [Int] -> Int
maior [] = 0
maior (a:b) =
  if a > maior(b) then
    a
  else
    maior(b)

menor ::  [Int] -> Int
menor [] = 0
menor (a:b) =
  if a < menor(b) then
    a
  else
    menor(b)

diferencaMaiorMenor ::  [Int] -> Int
diferencaMaiorMenor [] = 0
diferencaMaiorMenor l = (maior l) - (menor l)

main = do
  print( (diferencaMaiorMenor [-10, 5,-2]) )
