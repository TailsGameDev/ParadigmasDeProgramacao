{-
Crie uma func¸˜ao echo :: IO (), a qual lˆe um caracter e simplesmente o imprime
na tela. N˜ao crie nenhuma func¸˜ao auxiliar e nem altere os parˆametros da
fun¸c˜ao escreva. Crie uma vers˜ao usando >>= e outra usando a notac¸˜ao do.

-}

echo :: IO ()
echo = do
  n <- getChar
  m <- putChar (n)
  return m

echo2 :: IO ()
echo2 = getChar >>= \n -> (putChar n) >>= \m -> return m

main = do
  echo
  putStr("\n")
  echo2 -- acaba pegando o \n do enter
