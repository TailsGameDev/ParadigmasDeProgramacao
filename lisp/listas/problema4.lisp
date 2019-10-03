#|
compute a diferença entre o maior e o menor numero de uma lista
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

(defun greater ( x y )
  (cond
    ( (> x y) x)
    (t y)
  )
)

(defun maior (lista)
  (cond
    ( (null lista) 0 )
    ( (= (comprimento lista) 1) (car lista) )
    ( t (greater (car lista) (maior (cdr lista) )) )
  )
)

(defun absoluto (num)
  (cond
    ( (> num 0) num )
    ( t (- 0 num) )
  )
)

(defun diferencaMaiorMenor (lista)
  (absoluto (- (maior lista) (menor lista) ))
)

(defun main ()
  (write-line (write-to-string (diferencaMaiorMenor '(1 2 -3) ) ) )
)

(main)
