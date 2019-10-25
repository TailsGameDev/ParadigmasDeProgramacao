

(defun conde ()
  (setq r 0)
  (setf jahRetornou nil)
  (cond
    (t r)
  )
  (cond
    ((jahRetornou) r)
  )
)

(defun imprima (g)
  (write-line (write-to-string g))
)

(defun mp (p)
  (first (last p))
)

(defun main ()
 (imprima (mp '(1 2 3) ))
 (imprima (conde))
)

(main)
