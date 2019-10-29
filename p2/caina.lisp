;absolutas->
(setq e 0)
(setq inf 99999999999)
(setq o (- 1))
(setq di 1)
(setq indo T)
(setq voltando NIL)
(setq tam 6)
(setq limite 10000)

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

(setf m1 (make-array `(5 5)
  :initial-contents `((0  1  3  2 0)
                      (1 -1 -1 -1 2)
                      (3 -1 -1 -1 1)
                      (2 -1 -1 -1 2)
                      (0  2  1  2 0)))
)


(setf t1 (make-array `(5 5)
  :initial-contents `((0  1  3  2 0)
                      (1  1  2 -1 2)
                      (3 -1 -1 -1 1)
                      (2 -1 -1 -1 2)
                      (0  2  1  2 0)))
)

(setf r1 (make-array `(5 5)
  :initial-contents `((0 1 3 2 0)
                      (1 3 1 2 2)
                      (3 1 2 3 1)
                      (2 2 3 1 2)
                      (0 2 1 2 0)))
)

(setf vm1 (make-array `(5 5)
	:initial-contents `((-1 -1 -1 -1 -1)
                      (-1  0  0  0 -1)
                      (-1  0  0  0 -1)
                      (-1  0  0  0 -1)
                      (-1 -1 -1 -1 -1)))
)

(setf v22 (make-array `(4 4)
  :initial-contents `((-1 -1 -1 -1)
                      (-1  0  0 -1)
                      (-1  0  0 -1)
                      (-1 -1 -1 -1)))
)

(setf v33 (make-array `(5 5)
  :initial-contents `((-1 -1 -1 -1 -1)
                      (-1  0  0  0 -1)
                      (-1  0  0  0 -1)
                      (-1  0  0  0 -1)
                      (-1 -1 -1 -1 -1)))
)

(setf v44 (make-array `(6 6)
  :initial-contents `((-1 -1 -1 -1 -1 -1)
                      (-1  0  0  0  0 -1)
                      (-1  0  0  0  0 -1)
                      (-1  0  0  0  0 -1)
                      (-1  0  0  0  0 -1)
                      (-1 -1 -1 -1 -1 -1)))
)

;-------------------------------M2---------------------------------
(setf p2 `(1 2))
(setf m2 (make-array `(4 4)	:initial-contents `((0  2  1 0)
                                                (2 -1 -1 1)
                                                (1 -1 -1 2)
                                                (0  1  2 0))))
(setf v2 (make-array `(4 4) :initial-contents `((-1 -1 -1 -1)
                                                (-1  0  0 -1)
                                                (-1  0  0 -1)
                                                (-1 -1 -1 -1))))
(setf r2 (make-array `(4 4) 	:initial-contents `((0 2 1 0)
                                                  (2 1 2 1)
                                                  (1 2 1 2)
                                                  (0 1 2 0))))
;-----------------------------M3-----------------------------------
(setf cp3 `(1 2 3))
(setf cm3 (make-array `(5 5) :initial-contents `(( 0  2  2  1  0)
                                                 ( 3  0  0  0  1)
                                                 ( 1  0  0  0  2)
                                                 ( 2  0  0  0  2)
                                                 ( 0  2  1  3  0))))
(setf cr3 (make-array `(5 5) :initial-contents `(( 0  2  2  1  0)
                                                  ( 3  1  2  3  1)
                                                  ( 1  3  1  2  2)
                                                  ( 2  2  3  1  2)
                                                  ( 0  2  1  3  0))))
(setf cv3 (make-array `(5 5) :initial-contents `((-1 -1 -1 -1 -1)
                                                 (-1  0  0  0 -1)
                                                 (-1  0  0  0 -1)
                                                 (-1  0  0  0 -1)
                                                 (-1 -1 -1 -1 -1))))
;-----------------------------M8-----------------------------------
(setf cp8 `(1 2 3 4))
(setf cm8 (make-array `(6 6) :initial-contents `(( 1  0  0  0  0  0)
                                                 ( 0 -1 -1 -1 -1  0)
                                                 ( 0 -1 -1 -1 -1  0)
                                                 ( 0 -1 -1 -1 -1  0)
                                                 ( 0 -1 -1 -1 -1  2)
                                                 ( 0  0  0  0  4  0))))
(setf cr8 (make-array `(6 6) :initial-contents `(( 1  0  0  0  0  0)
                                                 ( 0  2  3  1  4  0)
                                                 ( 0  1  4  2  3  0)
                                                 ( 0  4  1  3  2  0)
                                                 ( 0  3  2  4  1  2)
                                                 ( 0  0  0  0  4  0))))
(setf cv8 (make-array `(6 6) :initial-contents `((-1 -1 -1 -1 -1 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1 -1 -1 -1 -1 -1))))

(setf m3 (make-array `(6 6)
  :initial-contents `((0  0  3  2  0 0)
                      (4 -1 -1 -1 -1 0)
                      (0 -1 -1 -1 -1 0)
                      (3 -1 -1 -1 -1 0)
                      (0 -1 -1 -1 -1 0)
                      (0  0  0  0  0 0)))
)

(defun mp (p)
  (car (last p))
)

(defun getI (i lista)
  (if (= i 0)
    (car lista)
    (getI (- i 1) (cdr lista))
  )
)

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

(defun backX (x)
  (cond
    ((<= x 1) (- tam 2) )
    (t (- x 1) )
  )
)

(defun nextX (x)
  (cond
    ((>= x (- tam 2)) 1)
    (t (+ x 1))
  )
)

(defun backY (x y)
  (cond
    ( (and (<= x 1) (>= y 2)) (- y 1) )
    ( (and (<= x 1) (<  y 2)) (- y 1) ) ;erro: quer voltar mas tah no inicio
    (t y)
  )
)

(defun nextY (x y)
  (cond
    ( (and (>= x (- tam 2)) (<= y (- tam 3) ) ) (+ y 1) )
    ( (and (>= x (- tam 2)) (>= y (- tam 3) ) ) (- 0 1) ) ; chegou no final!!! troquei aqui de > para >=. se bugar pode ser isso. Boa sorte Cainã do futuro
    (t y)
  )
)

(defun imprima (g)
  (write-line (write-to-string g))
)

(defun getxym (x y m)
  (aref m y x)
)

(defun setXY (num x y m)
  (setf (aref m y x) num)
)

(defun jaTemNaLinha (n x y m)
	(cond
		((= x 1) NIL)
		((= n (getxym (- x 1) y m)) T)
		(t (jaTemNaLinha n (- x 1) y m))
	)
)

(defun jaTemNaColuna (n x y m)
	(cond
		((= y 1) NIL)
		((= n (getxym x (- y 1) m)) T)
		(t (jaTemNaColuna n x (- y 1) m))
	)
)

(defun jaTemNaDiagonalPrincipal (n x y m)
	(cond
		((= y 1) NIL)
		((= n (getxym x y m)) T)
		(t (jaTemNaDiagonalPrincipal m (- x 1) (- y 1) m))
	)
)

(defun jaTemNaDiagonalSecundaria (n x y m)
	(cond
		((= y 1) NIL)
		((= n (getxym x y m)) T)
		(t (jaTemNaDiagonalSecundaria n (+ x 1) (- y 1) m))
	)
)

(defun jaTemNasDiagonais (n x y m)
  (setq sec (= (+ x y) (- tam 1))) ; eh uma booleana que diz se tah na diagonal secundaria
  (cond
    ( (= y 1) NIL)
    ( (= n (getxym x y m)) t)
    ((and (= x y) sec)
      (or
        (jaTemNaDiagonalPrincipal n (- x 1) (- y 1) m)
        (jaTemNaDiagonalSecundaria n (+ x 1) (- y 1) m)
      )
    )
    ((= x y) (jaTemNaDiagonalPrincipal n (- x 1) (- y 1) m))
    (sec (jaTemNaDiagonalSecundaria n (+ x 1) (- y 1) m))
    ((and (not (= x y)) (not sec)) NIL); se chamar pra uma posicao fora das diagonais, retorna nil, indicando q tah suavee
  )
)

(defun linhaCerta (y m tam)
  (setq esq (getxym 0 y m)) ;numeros esq e dir dos lados da matriz (exigências)
  (setq dir (getxym (- tam 1) y m))
  (setq qvdd ( quantosVejoDaDireita (- tam 1) y m 0))
  (setq qvde (quantosVejoDaEsquerda 0 y m 0))
  (cond
    ( (and (= esq e) (= dir e)) t) ; e eh o valor padrao de sem exigência
    ( (= esq e) (= dir qvdd) )
    ( (= dir e) (= esq qvde) )
    ( t (and (= dir qvdd) (= esq qvde)) )
  )
)

(defun colunaCerta (x m tam)
  (setq cima  (getxym x 0 m))
  (setq baixo (getxym x (- tam 1) m))
  (setq qvdc (quantosVejoDeCima x 0 m 0) )
  (setq qvdb (quantosVejoDeBaixo x (- tam 1) m 0) )
  (cond
    ((and (= cima e) (= baixo e)) T)
    ((= cima  e) (= baixo qvdb))
    ((= baixo e) (= cima  qvdc))
    (t (and (= baixo qvdb) (= cima  qvdc)))
  )
)

(defun quantosVejoDeCima (x y matriz maior)
	(cond
		((= y 0) (quantosVejoDeCima x (+ y 1) matriz maior))
		((= y (- tam 1)) 0)
		((> (getxym x y matriz) maior) (+ (quantosVejoDeCima x (+ y 1) matriz (getxym x y matriz)) 1))
		(t (quantosVejoDeCima x (+ y 1) matriz maior))
	)
)

(defun quantosVejoDaDireita (x y matriz maior)
	(cond
		((= x (- tam 1)) (quantosVejoDaDireita (- x 1) y matriz maior))
		((= x 0) 0)
		((> (getxym x y matriz) maior) (+ (quantosVejoDaDireita (- x 1) y matriz (getxym x y matriz)) 1))
		(t (quantosVejoDaDireita (- x 1) y matriz maior))
	)
)

(defun quantosVejoDeBaixo (x y matriz maior)
	(cond
		((= y (- tam 1)) (quantosVejoDeBaixo x (- y 1) matriz maior))
		((= y 0) 0)
		((> (getxym x y matriz) maior) (+ (quantosVejoDeBaixo x (- y 1) matriz (getxym x y matriz)) 1))
		(t (quantosVejoDeBaixo x (- y 1) matriz maior))
	)
)

(defun quantosVejoDaEsquerda (x y matriz maior)
	(cond
		((= x 0) (quantosVejoDaEsquerda (+ x 1) y matriz maior))
		((= x (- tam 1)) 0)
		((> (getxym x y matriz) maior) (+ (quantosVejoDaEsquerda (+ x 1) y matriz (getxym x y matriz)) 1))
		(t (quantosVejoDaEsquerda (+ x 1) y matriz maior))
	)
)

(defun vejoCertoDeCima (x matriz)
	(or (>= (getxym x 0 matriz) (quantosVejoDeCima x 0 matriz 0)) (= (getxym x 0 matriz) e))
)

(defun vejoCertoDaDireita (y matriz)
	(or (= (getxym (- tam 1) y matriz) (quantosVejoDaDireita (- tam 1) y matriz 0)) (= (getxym (- tam 1) y matriz) e))
)

(defun vejoCertoDeBaixo (x matriz)
	(or (= (getxym x (- tam 1) matriz) (quantosVejoDeBaixo x (- tam 1) matriz 0)) (= (getxym x (- tam 1) matriz) e))
)

(defun vejoCertoDaEsquerda (y matriz)
	(or (>= (getxym 0 y matriz) (quantosVejoDaEsquerda 0 y matriz 0)) (= (getxym 0 y matriz) e))
)

(defun vejoCerto (x y m)
	(cond
		((and (= x (- tam 2)) (= y (- tam 2))) (and (vejoCertoDeCima x m) (vejoCertoDaDireita y m) (vejoCertoDeBaixo x m) (vejoCertoDaEsquerda y m)))
		((= x (- tam 2)) (and (vejoCertoDeCima x m) (vejoCertoDaDireita y m) (vejoCertoDaEsquerda y m)))
		((= y (- tam 2)) (and (vejoCertoDeCima x m) (vejoCertoDeBaixo x m) (vejoCertoDaEsquerda y m)))
		(t (and (vejoCertoDeCima x m) (vejoCertoDaEsquerda y m)))
	)
)

(defun tahOk (x y m)
  (progn
    (setq num (getxym x y m))
  	(setq vc (vejoCerto x y m))
    (setXY o x y m)
  	(setq ntl (not (jaTemNaLinha num x y m)))
    (setq ntc (not (jaTemNaColuna num x y m)))
    (setq ntd (not (jaTemNasDiagonais num x y m)))
    (setXY num x y m)
    (setq lc (or (< x (- tam 2))  (linhaCerta y m tam)) )
    (setq cc (or (< y (- tam 2)) (colunaCerta x m tam)) )
    (and vc ntl ntc (or ntd (/= (getxym 0 0 m) di)) lc cc)
  )
)

;k= limiteDaRecursao, x, y, m, v=matrizGuardaIndexNoVetorDePossiveis,
;p=listaDeNumerosPossiveis[100% constante] d=RepetiçãoEhProibidaNasDiagonais
(defun resolve (k x y m v p s)
  (printMatriz m tam)
  (setq posConstante (= (- 1) (getxym x y v)))
  (setq m-anterior (getxym x y m))
  (setq v-anterior (getxym x y v))
  (progn
    (setXY (getI (getxym x y v) p) x y m)
    (setXY (+ (getxym x y v) 1) x y v)
    ; (printMatriz m-anterior tam)
    (cond
      ((<= k 0) m) ;escolher m ou v para retornar (chegou no limite da recursão)
      ((and posConstante (= s indo))
        (progn
          (setXY m-anterior x y m)
          (setXY v-anterior x y v)
          (resolve (- k 1) (nextX x) (nextY x y) m v p indo)
        )
      )
      ( (and posConstante (= s voltando))
        (setXY m-anterior x y m)
        (setXY v-anterior x y v)
        (resolve (- k 1) (backX x) (backY x y) m-anterior v-anterior p voltando)
      )
      ((not (getxym x y m))
        (progn
          (setXY o x y m)
          (setXY 0 x y v)
          (resolve (- k 1) (backX x) (backY x y) m v p voltando)
        )
      )
      ((and (<= (nextY x y) (- 1)) (tahOk x y m)) m) ; resolveu
      ((tahOk x y m) (resolve (- k 1) (nextX x) (nextY x y) m v p s))
      ((not (tahOk x y m)) (resolve (- k 1) x y m v p s))
    )
  )
)

(defun igual (m r x y)
  (cond
    ((= y (- 1)) t)
    ( (= (getxym x y m) (getxym x y r)) (igual m r (nextX x) (nextY x y)) )
    (t nil)
  )
)

(defun testa (m r v p d texto)
  (setq ans (resolve limite 1 1 m v p d))
  (cond
    ( (igual ans r 1 1) (concatenate `string "resolvida: " texto) )
    ( t (concatenate `string "errada: " texto) )
  )
)

(defun main()

    ;(setq tam 6)
    ;( printMatriz (resolve 10000 1 1 m3 v44 `(1 2 3 4) T) tam )

    ;testes passando
    ;(setq tam 4)
    ;(imprima (testa m2 r2 v2 `(1 2) NIL " m2."))
    ;(setq tam 5)
    ;(imprima (testa cm3 cr3 cv3 cp3 NIL " cm3."))

    (setq tam 6)
    (resolve 10000 1 1 cm8 cv8 `(1 2 3 4) T)
    ;( printMatriz (resolve 10000 1 1 cm8 cv8 `(1 2 3 4) T) tam )
    ;(setq tam 6)
    ;(imprima (testa cm8 cr8 cv8 cp8 T " cm8."))

    ;se bugar tenta usar def-var. Compilar antes de apresentar:
    ;clisp -c caina.lisp eeeee clisp caina.fas

    ; (imprima (tahOk 2 1 t1))

)


(main)
