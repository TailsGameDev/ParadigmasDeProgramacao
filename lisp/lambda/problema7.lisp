(defun filtrar (f lista)
  (if (null lista)
    ()
    (if (funcall f (car lista))
    (cons (car lista) (filtrar f (cdr lista)))
    (filtrar f (cdr lista))
    )
  )
)

(defun main ()
  (write-line (write-to-string
  (filtrar
    (lambda (x) (/= (mod x 2) 0) )
    (list 1 2 3 4 5 6 )
  ))
  )
)

(main)
