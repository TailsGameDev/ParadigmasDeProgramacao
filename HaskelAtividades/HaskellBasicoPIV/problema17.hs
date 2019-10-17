{-
 Crie uma fun ̧c ̃ao que receba um n ́umero n e retorne se o mesmo  ́e primo.
   Leia n do teclado
-}

divisivel:: Int -> Int -> String
divisivel a b =
  if ( (mod a b) == 0) then
    "a eh divisivel por b"
  else
    "a nao eh divisivel por b"

veprimo:: Int->Int-> String
veprimo _ 1 = "primo"
veprimo n i =
  if ( (mod n i)==0 ) then
    "nao primo"
  else
    veprimo n (i-1)

main = do
  print("digite um valor a")
  xString <- getLine
  let x = (read xString :: Int)
  print("o numero digitado eh:")
  print( (veprimo x (div x 2)) )
