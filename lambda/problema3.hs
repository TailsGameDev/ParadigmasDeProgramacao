{-
Crie uma express ̃ao Lambda que compute o n- ́esimo n ́umero de Fibonacci.
Leia n do teclado

exemplo sintaxe
fatorial :: Int -> Int
fatorial = fix (\f n -> if n == 0 then 1 else n * (f (n-1)))

main = do
  print (fatorial 5)

-}

import Data.Function

fib :: Int -> Int
fib = fix (\f n -> if n==0 then 0 else if n==1 then 1 else (f (n-1)) + (f (n-2)) )

main = do
  print ( (fib 5) )
