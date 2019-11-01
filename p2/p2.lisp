;absolutas->
;constante 'e' define quando não há exigências para quantos prédios devem ser vistos
(defvar e 0)
(defvar inf 99999999999) ; infinito
;o é a constante que define o número que indica que uma posição não foi visitada
(defvar o (- 1))
(defvar di 1) ; di define se as diagonais devem ser verificadas
; indo e vindo são maneiras de indicar se o programa está na direção de tentar
; novas possibilidades para o número atual e os próximos, ou se já esgotou as
; possibilidades e está voltando para consertar números anteriores
(defvar indo T)
(defvar voltando NIL)
; tam define o tamanho da matriz incluindo as duas linhas e colunas extra
(defvar tam 6)
(defvar limite 100000000) ; limite da recursão evita execuções eternas
(defvar c (- 2)) ; c na matriz v indica que a posição guarda uma constante em m.

#|
Matrizes são representadas com os arrays, conforme o exemplo do professor.

p é uma lista com os números possíveis para uma matriz, m é uma matriz, com
inclusive na volta dela, dizendo quandos prédios devem ser vistos.
r é a matriz de resultado, que se espera encontrar com a execução do programa.
v é uma matriz que guarda um índice em cada par xy, que é usado para acessar a
lista p de números possíveis.
estão sendo feito vários testes com uma execução do programa.
|#

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
;-----------------------------cm4-----------------------------------
(setf cp4 `(0 1 2 3))
(setf cm4 (make-array `(6 6) :initial-contents `(( 0  2  2  1  2  0)
                                                 ( 2 -1 -1 -1 -1  2)
                                                 ( 2 -1 -1 -1 -1  2)
                                                 ( 3 -1 -1 -1 -1  1)
                                                 ( 1 -1 -1 -1 -1  3)
                                                 ( 0  1  2  3  1  0))))
(setf cr4 (make-array `(6 6) :initial-contents  `(( 0  2  2  2  1  0)
                                                  ( 3  0  1  3  2  1)
                                                  ( 1  2  3  0  1  2)
                                                  ( 1  1  0  2  3  2)
                                                  ( 2  3  2  1  0  2)
                                                  ( 0  2  1  1  3  0))))
(setf cv4 (make-array `(6 6) :initial-contents `((-1 -1 -1 -1 -1 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1  0  0  0  0 -1)
                                                 (-1 -1 -1 -1 -1 -1))))
;-----------------------------M233-----------------------------------
(setf cp233 `(1 2 3 4 5))
(setf cm233 (make-array `(7 7) :initial-contents `(( 0  1  4  0  0  0  0)
                                                   ( 0 -1 -1 -1 -1 -1  4)
                                                   ( 0 -1 -1 -1 -1 -1  3)
                                                   ( 3 -1 -1 -1 -1 -1  0)
                                                   ( 0 -1 -1 -1 -1 -1  0)
                                                   ( 2 -1 -1 -1 -1 -1  0)
                                                   ( 0  0  1  2  2  3  0))))
(setf cr233 (make-array `(7 7) :initial-contents `(( 0  1  4  0  0  0  0)
                                                   ( 0  5  1  4  3  2  4)
                                                   ( 0  1  2  5  4  3  3)
                                                   ( 3  3  4  2  1  5  0)
                                                   ( 0  2  3  1  5  4  0)
                                                   ( 2  4  5  3  2  1  0)
                                                   ( 0  0  1  2  2  3  0))))
(setf cv233 (make-array `(7 7) :initial-contents `((-1 -1 -1 -1 -1 -1 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1 -1 -1 -1 -1 -1 -1))))
;-----------------------------M197-----------------------------------
(setf cp197 `(0 1 2 3 4))
(setf cm197 (make-array `(7 7) :initial-contents `((0  2  0  0  0  0  0)
                                                  ( 0 -1 -1 -1 -1 -1  0)
                                                  ( 4 -1 -1 -1 -1 -1  0)
                                                  ( 1 -1 -1 -1 -1 -1  2)
                                                  ( 2 -1 -1 -1 -1 -1  2)
                                                  ( 0 -1 -1 -1 -1 -1  3)
                                                  ( 0  1  0  0  0  0  0))))
(setf cr197 (make-array `(7 7) :initial-contents `(( 0  2  0  0  0  0  0)
                                                   ( 0  3  0  2  4  1  0)
                                                   ( 4  1  2  3  0  4  0)
                                                   ( 1  0  4  1  2  3  2)
                                                   ( 2  2  1  4  3  0  2)
                                                   ( 0  4  3  0  1  2  3)
                                                   ( 0  1  0  0  0  0  0))))
(setf cv197 (make-array `(7 7) :initial-contents `((-1 -1 -1 -1 -1 -1 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1  0  0  0  0  0 -1)
                                                 (-1 -1 -1 -1 -1 -1 -1))))
;-----------------------------m78-----------------------------------
(setf cp78 `(1 2 3 4 5))
(setf cm78 (make-array `(7 7) :initial-contents `(( 0  5  3  4  0  0  0)
                                                  ( 4 -1 -1 -1 -1 -1  1)
                                                  ( 3 -1 -1 -1 -1 -1  0)
                                                  ( 2 -1 -1 -1 -1 -1  0)
                                                  ( 2 -1 -1 -1 -1 -1  0)
                                                  ( 0 -1 -1 -1 -1 -1  0)
                                                  ( 0  0  0  0  2  2  0))))
(setf cr78 (make-array `(7 7) :initial-contents `((0  5  3  4  0  0  0)
                                                 ( 4  1  3  2  4  5  1)
                                                 ( 3  2  4  3  5  1  0)
                                                 ( 2  3  5  4  1  2  0)
                                                 ( 2  4  1  5  2  3  0)
                                                 ( 0  5  2  1  3  4  0)
                                                 ( 0  0  0  0  2  2  0))))
(setf cv78 (make-array `(7 7) :initial-contents `((-1 -1 -1 -1 -1 -1 -1)
                                                   (-1  0  0  0  0  0 -1)
                                                   (-1  0  0  0  0  0 -1)
                                                   (-1  0  0  0  0  0 -1)
                                                   (-1  0  0  0  0  0 -1)
                                                   (-1  0  0  0  0  0 -1)
                                                   (-1 -1 -1 -1 -1 -1 -1))))

;maior possivel!!
(defun mp (p)
  (car (last p))
)

; retorna o iésimo elemento de uma lista
(defun getI (i lista)
  (if (= i 0)
    (car lista)
    (getI (- i 1) (cdr lista))
  )
)

; função auxiliar para imprimir uma matriz formatada
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


;as próximas funções servem para saber o próximo x ou y, ou o anterior dado um x ou y atual
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
    ( (and (= x (- tam 2)) (< y (- tam 2) ) ) (+ y 1) )
    ( (and (= x (- tam 2)) (= y (- tam 2) ) ) (- 1) ) ; chegou no final!!! troquei aqui de > para >=. se bugar pode ser isso. Boa sorte Cainã do futuro
    (t y)
  )
)

; como a função print deveria ter sido implementada por quem fez o Lisp
(defun imprima (g)
  (write-line (write-to-string g))
)

; redefinindo a função de acessar e alterar elemento da matriz, para que
; fique igual ao trabalho que fizemos em Haskell
(defun getxym (x y m)
  (aref m y x)
)

(defun setXY (num x y m)
  (setf (aref m y x) num)
)

;Dado uma posição e um número, verifica se esse número já existe na linha, coluna ou diagonais
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

; linhaCerta e colunaCerta verificam se a quantidade de prédios vista é exatamente
; igual à esperada
(defun linhaCerta (y m)
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

(defun colunaCerta (x m)
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

; funções quantos vejo contam quantos prédios são vistos de uma determinada direção
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

; vejoCerto de cima e da esquerda verificam se a resolução está indo bem, isto é,
; se a quantidade vista é menor ou igual à desejada. De baixo e direita exigem exatidão.
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

; função retorna verdade caso o número em (x,y) seja um bom palpite quanto à
; quantidade de prédios vistos.
(defun vejoCerto (x y m)
	(cond
		((and (= x (- tam 2)) (= y (- tam 2))) (and (vejoCertoDeCima x m) (vejoCertoDaDireita y m) (vejoCertoDeBaixo x m) (vejoCertoDaEsquerda y m)))
		((= x (- tam 2)) (and (vejoCertoDeCima x m) (vejoCertoDaDireita y m) (vejoCertoDaEsquerda y m)))
		((= y (- tam 2)) (and (vejoCertoDeCima x m) (vejoCertoDeBaixo x m) (vejoCertoDaEsquerda y m)))
		(t (and (vejoCertoDeCima x m) (vejoCertoDaEsquerda y m)))
	)
)

; tahOk retorna se o número em (x,y) é um bom palpite, ou seja, com tudo o que se sabe
; no momento da execução, verifica se aquele número provoca qualquer incoerência.
; isso considera a quantidade de prédios vistos de todas as direções, e se o número
; se repete na linha, diagonal ou coluna.
(defun tahOk (x y m)
  (progn
  	(setq vc (vejoCerto x y m))
  	(setq ntl (not (jaTemNaLinha (getxym x y m) x y m)))
    (setq ntc (not (jaTemNaColuna (getxym x y m) x y m)))
    (setq ntd (not (jaTemNasDiagonais (getxym x y m) x y m)))
    (setq lc (or (< x (- tam 2))  (linhaCerta y m)) )
    (setq cc (or (< y (- tam 2)) (colunaCerta x m)) )
    (and vc ntl ntc (or ntd (/= (getxym 0 0 m) di)) lc cc)
  )
)

; resolve implementa o backtracking. Ela posiciona o próximo número na lista de
; possíveis na posição (x,y), ou pula caso ela seja constante. Depois, chama outras
; funções para saber se é um bom palpite, e de acordo com isso, decide qual é a
; próxima posição a se tentar resolver.
;k= limiteDaRecursao, x, y, m, v=matrizGuardaIndexNoVetorDePossiveis,
;p=listaDeNumerosPossiveis[100% constante] s= indo ou voltando
(defun resolve (k x y m v p s)
  ;(printMatriz m tam) ; remova o ';' para acompanhar o puzzle sendo resolvido
  (setq posConstante (= c (getxym x y v)))
  (setq m-anterior (getxym x y m))
  (setq v-anterior (getxym x y v))
  (progn
    (setXY (getI (getxym x y v) p) x y m)
    (setXY (+ (getxym x y v) 1) x y v)
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
        (progn
          (setXY m-anterior x y m)
          (setXY v-anterior x y v)
          (resolve (- k 1) (backX x) (backY x y) m v p voltando)
        )
      )
      ((not (getxym x y m))
        (progn
          (setXY o x y m)
          (setXY 0 x y v)
          (resolve (- k 1) (backX x) (backY x y) m v p voltando)
        )
      )
      ((and (tahOk x y m) (= y (- tam 2)) (= x (- tam 2))) m) ; resolveu
      ((not (tahOk x y m)) (resolve (- k 1) x y m v p s))
      ((tahOk x y m) (resolve (- k 1) (nextX x) (nextY x y) m v p s))
    )
  )
)

; dada uma matriz m e uma matriz r, retorna true se m é igual a r
(defun igual (m r x y)
  (cond
    ((= y (- 1)) t)
    ( (= (getxym x y m) (getxym x y r)) (igual m r (nextX x) (nextY x y)) )
    (t nil)
  )
)

; dada um conjunto para teste (m,r,v,p), retorna um texto indicando se a resolução
; encontrada é igual à esperada. Isso permite fazer vários testes em uma execução.
(defun testa (m r v p s texto)
  (setq ans (resolve limite 1 1 m v p s))
  (cond
    ( (igual ans r 1 1) (concatenate `string "solução igual ao resultado esperado:" texto) )
    ( t (concatenate `string "solução difere do resultado esperado:" texto) )
  )
)

(defun main()
    ;testes passando
    (setq tam 4)
    (imprima (testa m2 r2 v2 `(1 2) T " m2."))
    (setq tam 6)
    (imprima (testa cm4 cr4 cv4 cp4 T " cm4."))
    (setq tam 7)
    (imprima (testa cm197 cr197 cv197 cp197 T " matriz apresentada 197"))
    (imprima (testa cm78 cr78 cv78 cp78 T " matriz apresentada 78"))

    ;exemplo de impressão do resultado:
    (imprima "exemplo de impressão de resultado, tabuleiro janko 233:")
    (printMatriz (resolve limite 1 1 cm233 cv233 cp233 T) tam)
)


(main)
