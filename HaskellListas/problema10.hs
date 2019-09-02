{-
Crie uma função com assinatura filtrar :: (t -> Bool) -> [t] -> [t], a qual recebe uma função,
uma lista e retorna uma nova lista. Esta função aplica a função recebida como parâmetro sobre cada
elemento da lista e caso o retorno da função for verdadeiro, então o elemento fará parte da nova lista, caso
contrário não. Para esta tarefa, utilize o conceito de list comprehension.
-}

vdd :: t->Bool
vdd _ = False

filtrar :: (t -> Bool) -> [t] -> [t]
filtrar f l1 = [a | a <- l1, (f a)]

main = do
  print( (filtrar vdd [2,3,4,5]) )
