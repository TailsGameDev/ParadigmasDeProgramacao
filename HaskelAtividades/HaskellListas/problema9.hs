{-
Crie uma função com assinatura mapear :: (t -> y) -> [t] -> [y], a qual recebe uma função, uma
lista e retorna uma lista. Esta função mapear fará o mesmo que a função map, ou seja, aplicar a função
recebida como parâmetro sobre cada elemento da lista e retornar a lista resultante. Não utilize map ou
filter para esta tarefa.
-}
plus:: t -> Int
plus k = 3

mapear :: (t -> y) -> [t] -> [y]
mapear f l1 = [(f a) | a <- l1]

main = do
  print( (mapear plus [2,3,4,5]) )
