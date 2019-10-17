{-
Crie uma fun ̧c ̃ao com assinaturaocorrencias ::  [Int] -> Int -> Int
,  a qual recebe uma lista deInt e um Int e retorna o n ́umero de vezes
 em que o elemento est ́a presente na lista.N ̃ao utilizenenhuma
 fun ̧c ̃ao pronta do Haskell para realizar esta tarefa.
-}

ocorrencias ::  [Int] -> Int -> Int
ocorrencias [] _ = 0
ocorrencias (a:b) n =
  if a == n then
    1 + (ocorrencias b n)
  else
    ocorrencias b n

main = do
  print( (ocorrencias [2,2,3,2] 2) )
