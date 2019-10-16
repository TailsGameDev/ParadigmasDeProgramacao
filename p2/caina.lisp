
(setf tamX 3)

(setf x (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((0 1 2)
                       (3 4 5)
                       (6 7 8))) ;inicializando a matriz com alguns valores
)

(defun maior(a)
    (setq m (aref a 0 0)) ;aref permite acessar uma posição i j da matriz, neste caso acesso a posição 0,0 da matriz a
    (dotimes (i 3) ;dotimes permite realizar um número fixo de iterações
        (dotimes (j 3)
            (if (> (aref a i j) m)
                (setq m (aref a i j))
            )
        )
    )
    m ;é o retorno da minha função
)
;----------------------------P2 abaixo ------------------------
(defun printMatriz (m tm)
  (setq s '(#\Newline))
  (dotimes (i tm)
    (dotimes (j tm)
      (setq aij (aref m i j))
      (setq mij (write-to-string aij ))
      (cond
        ( (<  aij 0) (setq mij (concatenate 'string " " mij) ) )
        ( (>= aij 0) (setq mij (concatenate 'string "  " mij) ) )
      )
      (setq s (concatenate 'string s mij " "))
    )
    (setq s (concatenate 'string s '(#\Newline) ) )
  )
  (write-line (write-to-string s))
)

(defun backX (x m tam)
  (cond
    ((<= x 1) (- tam 2) )
    ((t) (- x 1) )
  )
)

(defun nextX (x m tam)
  (cond
    ((>= x (- tam 2)) 1 )
    ((t) (+ x 1) )
  )
)

(defun backY (x y)
  (cond
    ( (and (<= x 1) (>= y 2)) (- y 1) )
    ( (and (<= x 1) (<  y 2)) (- y 1) ) ;erro: quer voltar mas tah no inicio
  )
)

(defun nextY (x y tam)
  (cond
    ( (and (>= x (- tam 2)) (<= y (- tam 3) ) ) (+ y 1) )
    ( (and (>= x (- tam 2)) (>  y (- tam 3) ) ) (- 0 1) ) ; chegou no final!!!
  )
)

(defun imprime (g)
  (write-line (write-to-string g))
)

;----------------------------P2 acima ------------------------
(defun main()
    (write-line (write-to-string x)) ;imprimindo uma matriz

    (write-line (write-to-string (aref x 0 0)))
    (write-line (write-to-string (aref x 1 1)))

    (write-line (write-to-string (maior x))) ;passando uma matriz como parâmetro

    ;(setf (aref x 0 1) (- 3)) ;alrerando o elemento da posição 0,1 para 33

    (write-line (write-to-string (maior x)))

    (printMatriz x tamX)
    (imprime (nextY 1 2 3))
)


(main)
