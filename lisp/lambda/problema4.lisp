(defun main ()
(setq x1 (read))
(setq y1 (read))
(setq z1 (read))
(setq x2 (read))
(setq y2 (read))
(setq z2 (read))
(write-line (write-to-string
  ((lambda (x1 y1 z1 x2 y2 z2)
    (expt
      (+
       (- (* x1 x1) (* x2 x2 ))
       (- (* y1 y1) (* y2 y2 ))
       (- (* z1 z1) (* z2 z2 ))
      )
       .5
    )
  ) x1 y1 z1 x2 y2 z2
  )
))
)

(main)
