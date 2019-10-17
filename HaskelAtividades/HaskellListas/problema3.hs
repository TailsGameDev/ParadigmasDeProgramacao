{-
Crie uma fun ̧c ̃ao com assinatura menor ::  [Int] -> Int,
 a qual recebe uma lista de Int e retorna o menor elemento da lista.
   Retorne 0 caso a lista for vazia.N ̃ao utilizenenhuma fun ̧c ̃ao
   pronta do Haskellpara realizar esta tarefa.
-}

menor ::  [Int] -> Int
menor [] = 0
menor (a:b) =
  if a < menor(b) then
    a
  else
    menor(b)

main = do
  print( (menor [2,6,8,-6,4]) )
