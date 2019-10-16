(defun main ()
  (setq a (read))
  (setq b (read))
  (write-line (write-to-string ((lambda (x y) (xor x y)) a b) ) )
)

(main)
