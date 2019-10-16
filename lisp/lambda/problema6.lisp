(defun mapear (f lista)
  (cond
    ( (null lista) () )
    ( t (cons (funcall f (car lista)) (mapear f (cdr lista))  ) )
  )
)


(defun main ()
  (write-line (write-to-string
  (mapear
    (lambda (x) (= (mod x 2) 0) )
    (list 1 2 3 4 5 6 )
  ))
  )
)

(main)
