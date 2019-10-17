{-
Crie uma função com assinatura primeiros :: Int -> [t] -> [t], a qual recebe um número de ele-
mentos, uma lista, e retorna uma lista. Esta função deve retornar uma lista com os n primeiros elementos
informados no primeiro parâmetro. Não utilize nenhuma função pronta to Haskell para esta tarefa.
-}
primeiros :: Int -> [t] -> [t]
primeiros 0 l = []
primeiros i (a:b) = [a] ++ (primeiros (i-1) b)

main = do
  print(primeiros 3 [1,2,3,4,5,6])
