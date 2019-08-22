{-
Crie uma fun ̧c ̃ao com assinaturamedia ::  [Int] -> Float,
 a qual recebe uma lista de Int e retornaa m ́edia de todos
  os elementos da lista.  Retorne 0 caso a lista for vazia.
  N ̃ao utilizenenhuma fun ̧c ̃aopronta do Haskell para realizar
  esta tarefa.  DICA: utilize a fun ̧c ̃aofromIntegralpara
   converter um tipointeiro para um tipo compat ́ıvel com o
   operador de divis ̃ao/
-}

comprimento :: [Int] -> Int
comprimento [] = 0
comprimento (_:b) = 1 + (comprimento b)

soma:: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

media ::  [Int] -> Float
media [] = 0
media l = fromIntegral(soma l) / fromIntegral(comprimento l)

main = do
  print( (media [3,4,5,6]) )
