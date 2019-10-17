{-
Utilize a fun ̧c ̃aomapque recebe como parˆametros uma lista num ́erica e
uma fun ̧c ̃ao lambda.  A fun ̧c ̃aolambda deve retornar par ou  ́ımpar
para cada n ́umero, ou seja, uma lista de booleans.
-}

main = do
  print ( (map (\x -> mod x 2==0) [0,1,2,3,4,5]) )
