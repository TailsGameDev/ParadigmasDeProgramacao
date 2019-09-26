#|
Crie uma funcao que receba dois valores booleanos (x, y)
 retorne o resultado do “ou exclusivo” (XOR)sobre eles.
   A funcao apenas deve usar os operadores &&, || e not.
     Leia os valores x e y do teclado.
-}

func :: Bool -> Bool -> Bool
func x y = (x && (not y)) || ((not x) && y)


main = do
    print("Digite true ou false")
    xString <- getLine
    let x = xString == "true\r" || xString == "true\n"
    print("Digite true ou false")
    yString <- getLine
    let y = yString == "true\r" || yString == "true\n"

    let resultado = func x y

    print(resultado)

|#

(defun eor (b1 b2)
  (or (and b1 (not b2)) (and (not b1) b2) )
)

(defun main ()
  (setq b1 (read))
  (setq b2 (read))
  (write-line (write-to-string (eor b1 b2) ) )
)

(main)
