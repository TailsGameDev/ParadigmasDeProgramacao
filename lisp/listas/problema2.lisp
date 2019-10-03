#|
funcao para fazer a media de uma lista
|#

(defun comprimento (lista)
  (cond
    ( (null lista) 0 )
    ( t (+ 1 (comprimento (cdr lista) )) )
  )
)

(defun soma (lista)
  (cond
    ( (null lista) 0 )
    ( t (+ (car lista) (soma (cdr lista) )) )
  )
)

(defun media (lista)
  (/ (soma lista) (comprimento lista) )
)

(defun main ()
  (write-line (write-to-string (media '(1 2 3) ) ) )
)

(main)
