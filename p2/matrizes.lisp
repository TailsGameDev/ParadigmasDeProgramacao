
(setf x (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((0 1 2 ) (3 4 5) (6 7 8))) ;inicializando a matriz com alguns valores
)

(setf m1 (make-array `(5 5)
	:initial-contents `((0 1 3 2 0)
		                (1 3 1 2 2)
		                (3 1 2 3 1)
		                (2 2 3 1 2)
		                (0 2 1 2 0)))
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

(defun getxym (x y m)
	(aref m y x)
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

(defun imprime (g)
	(write-line (write-to-string g))
)

(defun jaTemNaLinha (n x y m)
	(cond
		((= x 0) NIL)
		((= n (getxym (- x 1) y m)) T)
		(t (jaTemNaLinha n (- x 1) y m))
	)
)

(defun jaTemNaColuna (n x y m)
	(cond
		((= y 0) NIL)
		((= n (getxym x y m)) T)
		(t (jaTemNaColuna n x (- y 1) m))
	)
)

(defun jaTemNasDiagonais (n x y m)

)

(defun jaTemNaDiagonalPrincipal (n x y m)
	(cond 
		((= y 0) NIL)
		((= n (getxym x y m)) T)
		(t (jaTemNaDiagonalPrincipal m (- x 1) (- y 1)))
	)
)

(defun jaTemNaDiagonalSecundaria (n x y m)
	(cond
		((= y 0) NIL)
		((= n (getxym x y m)) T)
		(t (jaTemNaDiagonalSecundaria n (+ x 1) (- y 1) m))
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
	(setq vc (vejoCerto x y m))
	(setq jtl (jaTemNaLinha))
	vc
)

; tahOk :: Int -> Int -> [Int] -> Bool
; tahOk x y m
;     | (getxym 0 0 m == d) && ((x == y) || (x + y == (tam m) - 1)) = (vejoCerto x y m) && (not (jaTemNaLinha (getxym x y m) x y (setXY (o) x y m) ) ) && (not (jaTemNaColuna (getxym x y m) x y (setXY (o) x y m)))
;         && (not (jaTemNasDiagonais (getxym x y m) x y (setXY (o) x y m)))
;     | otherwise = (vejoCerto x y m) && (not (jaTemNaLinha (getxym x y m) x y (setXY (o) x y m))) && (not (jaTemNaColuna (getxym x y m) x y (setXY (o) x y m)) )


; vejoCerto :: Int -> Int -> [Int] -> Bool
; vejoCerto x y m =
;     (((getxym 0 y m) >= quantosVejo 1 y 0 0 1 0 ((tam m)-1) inf m) || (getxym 0 y m) == e) && --esqParaDir
;     --dirParaEsq -- equivalenca ( se p -> q) para (not p || q), ou seja, se x==tam-1 então linha deve ser valida. pois antes nao dah pra saber ao certo
;     ((not (x == ((tam m)-2)) ) || linhaCerta y m) &&
;     (((getxym x 0 m) >= quantosVejo x 1 0 0 0 1 inf ((tam m)-1) m) || (getxym x 0 m) == e) && --cimaParaBaixo
;     -- baixoPraCima equivalencia tambem.. se y==tam-1 então verificar de baixo pra cima
;     ((not (y == ((tam m)-2))) || colunaCerta x m || (getxym x ((tam m) - 1)) m == e)

(defun main()
    (write-line (write-to-string x)) ;imprimindo uma matriz

    (write-line (write-to-string m1)) ;imprimindo uma matriz
    
    (write-line (write-to-string (aref x 0 0)))
    (write-line (write-to-string (aref x 1 1)))
    
    (write-line (write-to-string (maior x))) ;passando uma matriz como parâmetro
    
    (setf (aref x 0 1) 33) ;alrerando o elemento da posição 0,1 para 33

    (write-line (write-to-string (maior x)))

	(printMatriz m1 tam)

    (write-line (write-to-string (quantosVejoDeCima 2 0 m1 0)))
    (write-line (write-to-string (quantosVejoDaDireita (- tam 1) 2 m1 0)))
    (write-line (write-to-string (quantosVejoDeBaixo 2 (- tam 1) m1 0)))
    (write-line (write-to-string (quantosVejoDaEsquerda 0 2 m1 0)))

    (imprime (vejoCertoDeCima 1 m1))
    (imprime (vejoCertoDaDireita 1 m1))
    (imprime (vejoCertoDeBaixo 1 m1))
    (imprime (vejoCertoDaEsquerda 1 m1))

    (imprime "vejoCerto")

    (imprime (vejoCerto 2 2 m1))
    (imprime (vejoCerto 2 3 m1))
    (imprime (vejoCerto 3 2 m1))
    (imprime (vejoCerto 3 3 m1))

    (imprime "tahOk")

    (imprime (tahOk 2 2 m1))
)

(setq tam 5)
(setq e 0)

(main)
