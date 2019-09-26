#|
2. Crie uma função que receba um número x, negativo ou positivo, e retorne seu valor absoluto. Leia x do teclado.
-}

absoluto :: Float -> Float
absoluto x = (x*x)**0.5

main = do
    xString <- getLine
    let x = (read xString :: Float)
    let absol = absoluto x
    print(absol)
|#

(defun absoluto (x)
  (expt (* x x) 0.5)
)

(defun main ()
  (setq x (read))
  (write-line (write-to-string (absoluto x) ) )
)

(main)
