{-
crie uma funcao que receba trˆes parˆametros Operador, x e y, e retorne o
 resultado da operacao matematica x Operador y.  Os operadores poss ́ıveis
  de informar s ̃ao +, -, *, /.  Leia o Operador, x e y do teclado.
-}

operador :: String-> Float -> Float -> Float
operador o a b  | o == "+" = a + b
                | o == "-" = a - b
                | o == "*" = a * b
                | otherwise = a / b

main = do
  print("digite um valor b")
  xString <- getLine
  let x = (read xString :: Float)
  print("digite um valor a")
  yString <- getLine
  let y = (read yString :: Float)
  print("digite um operador")
  o <- getLine
  print( (operador o x y) )
