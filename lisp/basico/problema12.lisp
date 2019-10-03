#|
{-
Crie  uma  fun ̧c ̃ao  que  receba  trˆes  n ́umeros  x,  y  e  z  e  retorne
  o  m ́aximo  divisor  comum  (DICA:  apenasmodifique o algoritmo anterior).
    Leia x, y e z do teclado.
-}
{-
Crie uma fun ̧c ̃ao que receba dois n ́umeros x e y e retorne o m ́aximo divisor
 comum (DICA: pesquise sobreo Algoritmo de Euclides).  Leia x e y do teclado.
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

main = do
  print("digite um valor a")
  xString <- getLine
  let x = (read xString :: Int)
  print("digite um valor  b")
  yString <- getLine
  let y = (read yString :: Int)
  print("digite um valor  c")
  zString <- getLine
  let z = (read zString :: Int)

  print("O MDC eh: ")
  print( (euclides (euclides x y) z) )
|#

(defun euclides (a b)
  (cond
    ( (= b 0) a)
    ( t (euclides b (mod a b)))
  )
)

(defun main ()
  (setq a (read))
  (setq b (read))
  (setq c (read))
  (write-line (write-to-string (euclides (euclides a b) c) ) )
)

(main)
