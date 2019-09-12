{-
Crie uma express ̃ao Lambda que receba dois valores booleanos (x, y) retorne
o resultado do “ou exclusivo”(XOR) sobre eles.
Leia os valores x e y do teclado.
( a and (not b) ) or (b and (not a))
-}

main = do
  print ((\x y -> (x && (not y)) || (y && (not x)) ) True False)
  --print ((\a b -> a and b  ) True True)
