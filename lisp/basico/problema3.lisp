#|
3. Crie uma função que receba a base e a altura de um triângulo e calcule a área do mesmo. Leia a base e a altura do teclado.
-}

area :: Float -> Float -> Float
area x y = x*y/2


main = do
    xString <- getLine
    let x = (read xString :: Float)
    yString <- getLine
    let y = (read yString :: Float)

    let a = area x y

    print(a)
|#

(defun area (base altura)
  ( / (* base altura) 2)
)

(defun main ()
  (setq base (read))
  (setq altura (read))
  (write-line (write-to-string (area base altura) ) )
)

(main)
