{-
Crie uma função com assinatura inverte :: [t] -> [t], a qual recebe uma lista como parâmetro e
deve retornar a mesma invertida. Não utilize nenhuma função pronta do Haskell para realizar esta tarefa.
-}

ultimo :: Eq t => [t] -> t
ultimo (a:b) =
  if (b == []) then
    a
  else
    ultimo b

primeiros :: Eq t => [t] -> [t]
primeiros (a:b:c) =
  if c==[] then
    [a]
  else
    [a] ++ primeiros ([b] ++ c)

inverte :: [t] -> [t]
inverte [] = []
inverte [e] = [e]
inverte .oa = (primeiro a) &

main = do
  print( (primeiros [2,3,4]) )
