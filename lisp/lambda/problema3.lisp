
(defun main ()

  (setq a (read))
  (setq b (read))
  (setq c (read))
  (setq deltaSqr (expt (* 4 a c) .5) )
  (write-line (write-to-string
    ((lambda (a b c deltaSqr) ( / (- deltaSqr b) (+ a a)) )a b c deltaSqr)
  ))
  (write-line (write-to-string
    ((lambda (a b c deltaSqr) ( / (- (- deltaSqr) b) (+ a a)) )a b c deltaSqr)
  ))
)

(main)
