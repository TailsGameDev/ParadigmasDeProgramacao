#|
faça função menor de uma lista
|#

(defun comprimento (lista)
  (cond
    ( (null lista) 0 )
    ( t (+ 1 (comprimento (cdr lista) )) )
  )
)

(defun lesser ( x y )
  (cond
    ( (< x y) x)
    (t y)
  )
)

(defun menor (lista)
  (cond
    ( (null lista) 0 )
    ( (= (comprimento lista) 1) (car lista) )
    ( t (lesser (car lista) (menor (cdr lista) )) )
  )
)

(defun main ()
  (write-line (write-to-string (menor '(1 2 -3) ) ) )
)

(main)
