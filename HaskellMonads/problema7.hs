{-
Crie uma func¸˜ao escreva :: String -> Int -> IO (), a qual recebe como
parˆametros uma string e um inteiro n e imprime na tela os n primeiros
caracteres da string. Para imprimir cada caracter, utilize a fun¸c˜ao putChar.
N˜ao crie nenhuma func¸˜ao auxiliar e nem altere os parˆametros da fun¸c˜ao
escreva. Crie uma vers˜ao usando >>= e outra usando a notac¸˜ao do.

-}

escreva :: String -> Int -> IO ()
escreva txt 0 = putChar(txt!!0)
escreva txt n = do
  x <- putChar(txt!!n)
  xs <- (escreva txt (n -1) )
  return xs

escreva2 :: String -> Int -> IO()
escreva2 txt 0 = putChar(txt!!0)
escreva2 txt n = putChar(txt!!n) >>=
  \x -> (escreva2 txt (n -1) ) >>=
    \xs -> return (xs)

main = do
  escreva "oiecara" 2
  putStr("\n")
  escreva2 "oiecara" 2
