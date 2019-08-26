{-
Crie uma fun ̧c ̃ao que receba um n ́umerone retorne a fun ̧c ̃ao totiente de Euler
(φ(n)).  A fun ̧c ̃ao totientede Euler  ́e dada pelo numero de inteirospositivos
a partir de 1 e menores que n, ou seja 1<=r < n,que sao coprimos de n.
Por exemplo, se n=10, entao os coprimos de 10 de 1 at ́e 10-1 s ̃ao{1,3,7,9}
ea funcao deve retornar φ(n) = 4.  Leiando teclado.
-}

maior:: Int->Int->Int
maior m n =
  if m > n then
    m
  else
    n

menor :: Int->Int->Int
menor m n =
  if m < n then
    m
  else
    n

euclides :: Int->Int->Int
euclides a 0 = a
euclides a b = euclides b (mod a b)

coprimos:: Int->Int->String
coprimos a b =
  if (euclides a b) == 1 then
    "coprimos"
  else
    "nao coprimos"

contaCoprimos:: Int -> Int -> Int
contaCoprimos _ 1 = 1
contaCoprimos n i = --n eh fixo. i vai diminuindo
  if ( (coprimos n i) == "coprimos" ) then
    1 + ( contaCoprimos n (i-1) )
  else
    ( contaCoprimos n (i-1) )

coprimosDeN:: Int -> Int
coprimosDeN n = contaCoprimos n n

main = do
  print("digite um valor n")
  xString <- getLine
  let x = (read xString :: Int)
  print("A quantidade de coprimos de n eh:")
  print( (coprimosDeN x) )
