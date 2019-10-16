
(setf x (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((0 1 2 ) (3 4 5) (6 7 8))) ;inicializando a matriz com alguns valores
)

(setf m1 (make-array `(5 5)
	:initial-contents `((0 0 0 0 0) (0 3 1 2 0) (0 1 2 3 0) (0 2 1 3 0) (0 0 0 0 0)))
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

(defun tam (m)
	5
)

(defun jaTemNaLinha (n x y m)
	(cond
		((= x 0) NIL)
		((= n (aref m x y)) T)
		(t (jaTemNaLinhaRecursivo n (- x 1) y m))
	)
)

(defun jaTemNaColuna (n x y m)
	(cond
		((= y 0) NIL)
		((= n (aref m x y)) T)
		(t (jaTemNaColuna n x (- y 1) m))
	)
)

(defun jaTemNasDiagonais (n x y m)

)

(defun jaTemNaDiagonalPrincipal (n x y m)
	(cond 
		((= y 0) NIL)
		((= n (aref m x y)) T)
		(t (jaTemNaDiagonalPrincipal m (- x 1) (- y 1)))
	)
)

(defun jaTemNaDiagonalSecundaria (n x y m)
	(cond
		((= y 0) NIL)
		((= n (aref m x y)) T)
		(t (jaTemNaDiagonalSecundaria n (+ x 1) (- y 1) m))
	)
)

(defun quantosVejoDeCima (x y matriz maior)
	(cond
		((= y 0) (quantosVejoDeCima x (+ y 1) matriz maior))
		((= y (- (tam matriz) 1)) 0)
		((> (aref matriz x y) maior) (+ (quantosVejoDeCima x (+ y 1) matriz (aref matriz x y)) 1))
		(t (quantosVejoDeCima x (+ y 1) matriz maior))
	)
)

(defun quantosVejoDaDireita (x y matriz maior)
	(cond
		((= x (- (tam m) 1)) (quantosVejoDaDireita (- x 1) y matriz maior))
		((= x 0) 0)
		((> (aref matriz x y) maior) (+ (quantosVejoDaDireita (- x 1) y matriz (aref matriz x y)) 1))
		(t (quantosVejoDaDireita (- x 1) y matriz maior))
	)
)

(defun quantosVejoDeBaixo (x y matriz maior)
	(cond
		((= y (- (tam m) 1)) (quantosVejoDeBaixo x (- y 1) matriz maior))
		((= y 0) 0)
		((> (aref matriz x y) maior) (+ (quantosVejoDeBaixo x (- y 1) matriz (aref matriz x y)) 1))
		(t (quantosVejoDeBaixo x (- y 1) matriz maior))
	)
)

(defun quantosVejoDaEsquerda (x y matriz maior)
	(cond
		((= x 0) (quantosVejoDaEsquerda (+ x 1) y matriz maior))
		((= x (- (tam m) 1)) 0)
		((> (aref matriz x y) maior) (+ (quantosVejoDaEsquerda (+ x 1) y matriz (aref matriz x y)) 1))
		(t (quantosVejoDaEsquerda (+ x 1) y matriz maior))
	)
)

(defun main()
    (write-line (write-to-string x)) ;imprimindo uma matriz

    (write-line (write-to-string m1)) ;imprimindo uma matriz
    
    (write-line (write-to-string (aref x 0 0)))
    (write-line (write-to-string (aref x 1 1)))
    
    (write-line (write-to-string (maior x))) ;passando uma matriz como parâmetro
    
    (setf (aref x 0 1) 33) ;alrerando o elemento da posição 0,1 para 33

    (write-line (write-to-string (maior x)))

    (write-line (write-to-string (quantosVejoDeCima 2 0 m1 0)))
)


(main)