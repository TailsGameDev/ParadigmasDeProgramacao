{-
Crie uma função com assinatura inverte :: [t] -> [t], a qual recebe uma lista como parâmetro e
deve retornar a mesma invertida. Não utilize nenhuma função pronta do Haskell para realizar esta tarefa.
-}

{-
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
inverte (a:b) = (ultimo b) ++ (inverte (primeiros b) ) ++ a
--inverte [e] = [e]
--inverte .oa = (primeiro a) &
-}

inverte :: [t] -> [t]
inverte [] = []
inverte (a:b) = (inverte b) ++ [a]

main = do
  print( (inverte [2,3,4,5]) )
