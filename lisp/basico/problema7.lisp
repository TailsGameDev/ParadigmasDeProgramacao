#|
{-
Crie uma funcao que compute o enesimo numero de fibonacci. Leia n do teclado
-}

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = (fibonacci (n-1)) + (fibonacci (n-2))

main = do
    print("Digite um valor")
    xString <- getLine
    let x = (read xString :: Int)

    print( (fibonacci x) )
|#

(defun absoluto (x)
  (expt (* x x) 0.5)
)

(defun fibonacci (a)
  (cond
    ( (= a 0) 0)
    ( (= a 1) 1)
    (t (+ (fibonacci (- a 1)) (fibonacci (- a 2)) ) )
  )
)

(defun main ()
  (setq x (read))
  (write-line (write-to-string (fibonacci x) ) )
)

(main)
