{-
Crie uma fun ̧c ̃ao com assinaturabusca ::  [Int] -> Int -> Bool,
 a qual recebe uma lista de Int e umInt e retorna se o elemento
 passado como parˆametro encontra-se na lista ou n ̃ao.N ̃ao
  utilizenenhumafun ̧c ̃ao pronta do Haskell para realizar esta tarefa.
-}

busca ::  [Int] -> Int -> Bool
busca [] _ = False
busca (a:b) num = (num == a) || (busca b num)
{-
  if num == a then
    True
  else
    busca b num
-}

main = do
  print( (busca [2,6,5,3] 9) )
