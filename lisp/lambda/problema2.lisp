(defun main ()
(setq x (read))
(setq y (read))
(setq z (read))
(write-line (write-to-string ((lambda (x y z) (if ( >= (/(+ x y z) 3) 6) "aprovado" "reprovado")) x y z)))
;(write-line (write-to-string (lambda (a b c) (if (div (+ a b c) (>=3 6)) x y ) x y z )))
)

(main)
