;absolutas->
(setq e 0)
(setq inf 99999999999)
(setq o (- 1))

;matrizes para testar ->
(setq tamM 3)
(setf M (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((0 1 2)
                       (3 4 5)
                       (6 7 8))) ;inicializando a matriz com alguns valores
)
(setf vM (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((-1 -1 -1)
                       (-1  0 -1)
                       (-1 -1 -1))) ;inicializando a matriz com alguns valores
)

(setq tamM1 5)
(setf m1 (make-array `(5 5)
	:initial-contents `((0 0 0 0 0)
                      (0 3 1 2 0)
                      (0 1 2 3 0)
                      (0 2 1 3 0)
                      (0 0 0 0 0)))
)
(setf vm1 (make-array `(5 5)
	:initial-contents `((-1 -1 -1 -1 -1)
                      (-1  0  0  0 -1)
                      (-1  0  0  0 -1)
                      (-1  0  0  0 -1)
                      (-1 -1 -1 -1 -1)))
)

(setf m2 (make-array `(5 5)
	:initial-contents `((0 2 1 0)
                      (2 o o 1)
                      (1 o o 2)
                      (0 1 2 0)))
)
(setf r2 (make-array `(5 5)
	:initial-contents `((0 2 1 0)
                      (2 1 2 1)
                      (1 2 1 2)
                      (0 1 2 0)))
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

(defun imprima (g)
  (write-line (write-to-string g))
)

(defun getxym (x y m)
  (aref m y x)
)


(defun linhaCerta (y m tam)
  (setq esq (getxym 0 y m)) ;numeros esq e dir dos lados da matriz (exigências)
  (setq dir (getxym (- tam 1) y m))
  (setq qvdd ( quantosVejoDaDireita (- tam 2) y m inf))
  (setq qvde (quantosVejoDaEsquerda 1 y m inf))
  (cond
    ( (and (= esq e) (= dir e)) t) ; e eh o valor padrao de sem exigência
    ( (= esq e) (= dir qvdd) )
    ( (= dir e) (= esq qvde) )
    ( (t) (and (= dir qvdd) (= esq qvde)) )
  )
)

(defun colunaCerta (x m tam)
  (setq cima  (getxym x 0 m))
  (setq baixo (getxym x (- tam 1) m))
  (setq qvdc (quantosVejoDeCima x 1 m inf) )
  (setq qvdb (quantosVejoDeBaixo x (- tam 2) m inf) )
  (cond
    ((and (= cima e) (= baixo e)) t)
    ((= cima  e) (= baixo qvdb))
    ((= baixo e) (= cima  qvdc))
    ((t) (and (= baixo qvdb) (= cima  qvdc)))
  )
)
;----------------------------P2 acima ------------------------
(defun main()
    ;(write-line (write-to-string m)) ;imprimindo uma matriz

    ;(write-line (write-to-string (aref m 0 0)))
    ;(write-line (write-to-string (aref m 1 1)))

    ;(write-line (write-to-string (maior m))) ;passando uma matriz como parâmetro

    ;(setf (aref x 0 1) (- 3)) ;alrerando o elemento da posição 0,1 para 33

    ;(write-line (write-to-string (maior m)))

    (printMatriz m1 tamM1)
    (imprima (nextY 1 2 3))
    (imprima (getxym 1 1 m1))
)


(main)
