#|{-
Crie  uma  fun ̧c ̃ao  que  receba  trˆes  inteiros  x,  y  e  z  e
retorne  se  havendo  varetas  com  esses  valores
  emcomprimento  pode-se  construir  um  triˆangulo.
     Exemplo,  com  varetas  de  comprimento  4,  8  e  9
       possoconstruir um triˆangulo, por ́em com varetas de
        comprimento 10, 5 e 4 n ̃ao posso construir um triˆangulo
        .Leia x, y e z do teclado.

        Condicao de existencia do triangulo:
        | b - c | < a < b + c
        | a - c | < b < a + c
        | a - b | < c < a + b

-}

absoluto :: Float -> Float
absoluto x = (x*x)**0.5

func :: Float -> Float -> Float -> String
func a b  c | not (absoluto(b - c) < a && a < b + c) = "Falso"
            | not (absoluto(a - c) < b && b < a + c) = "Falso"
            | not (absoluto(a - b) < c && b < a + c) = "Falso"
            | otherwise = "Verdadeiro"


main = do
    print("Digite um valor")
    xString <- getLine
    let x = (read xString :: Float)
    print("Digite um valor")
    yString <- getLine
    let y = (read yString :: Float)
    print("Digite um valor")
    zString <- getLine
    let z = (read zString :: Float)

    let resultado = func x y z

    print("Eh ")
    print(resultado)
    print("que se pode construir um triangulo com arestas desse tamanho")
|#

(defun absoluto (x)
  (expt (* x x) 0.5)
)

(defun existeTriang (a b c)
  (cond
    ( and (< (absoluto(- b c) a)) (< a (+ b c)) "Falso")
    (t "Verdadeiro")
    | not (absoluto(b - c) < a && a < b + c) = "Falso"
    | not (absoluto(a - c) < b && b < a + c) = "Falso"
    | not (absoluto(a - b) < c && b < a + c) = "Falso"
    | otherwise = "Verdadeiro"
  )
)

(defun main ()
  (setq x (read))
  (setq y (read))
  (setq z (read))
  (write-line (write-to-string (existeTriang x y z) ) )
)

(main)
