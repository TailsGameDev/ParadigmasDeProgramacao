(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL
                      :esq (make-no :n 12 :esq NIL :dir NIL)
                      :dir (make-no :n 12 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56
                      :esq (make-no :n 55 :esq NIL :dir NIL)
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             )
    )
)

(defun soma (arv)
    (if (null arv)
        0
        (+
            (no-n arv)
            (soma (no-esq arv))
            (soma (no-dir arv))
        )
    )
)

(defun buscaElemento (arv x)
    (if (null arv)
        NIL
        (or
            (= (no-n arv) x)
            (buscaElemento (no-esq arv) x)
            (buscaElemento (no-dir arv) x)
        )
    )
)

(defun minimo (x y)
    (if (< x y)
        x
        y
    )
)

(setq INF 1000)

(defun minimoElemento (arv)
    (if (null arv)
        INF
        (minimo
            (no-n arv)
            (minimo
                (minimoElemento (no-esq arv))
                (minimoElemento (no-dir arv))
            )
        )
    )
)

(defun incrementa (arv x)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (+ (no-n arv) x))
            (incrementa (no-esq arv) x)
            (incrementa (no-dir arv) x)
        )
    )
)

;------------------------------ A abaixo -----------------------------------
(defun ocorrenciasElemento (arv x)
  (cond
    ((null arv) 0)
    ((/= (no-n arv) x)
      (+

        (ocorrenciasElemento (no-esq arv) x)
        (ocorrenciasElemento (no-dir arv) x)
      )
    )
    ((= (no-n arv) x)
      (+
        1
        (ocorrenciasElemento (no-esq arv) x)
        (ocorrenciasElemento (no-dir arv) x)
      )
    )
  )
)
;------------------------------ A acima  -----------------------------------

;------------------------------ B abaixo -----------------------------------
(defun maioresQueElemento (arv x)
  (cond
    ((null arv) 0)
    ((<= (no-n arv) x)
      (+
        (maioresQueElemento (no-esq arv) x)
        (maioresQueElemento (no-dir arv) x)
      )
    )
    ((> (no-n arv) x)
      (+
        1
        (maioresQueElemento (no-esq arv) x)
        (maioresQueElemento (no-dir arv) x)
      )
    )
  )
)
;------------------------------ B acima  -----------------------------------

;------------------------------ C abaixo -----------------------------------
(defun mediaElementos (arv)
  (/ (soma arv) (qtdElementos arv) )
)
;------------------------------ C acima  -----------------------------------

;------------------------------ D abaixo -----------------------------------
(defun qtdElementos (arv)
  (cond
    ((null arv) 0)
    (t
      (+
        1
        (qtdElementos (no-esq arv))
        (qtdElementos (no-dir arv))
      )
    )
  )
)
;------------------------------ D acima  -----------------------------------

;------------------------------ E abaixo -----------------------------------
(defun elementos (arv)
(cond
  ((null arv) [])
  (t
    (+
      1
      (qtdElementos (no-esq arv))
      (qtdElementos (no-dir arv))
    )
  )
)
)
;------------------------------ E acima  -----------------------------------

;------------------------------ F abaixo -----------------------------------
;------------------------------ F acima  -----------------------------------

;------------------------------ G abaixo -----------------------------------
;------------------------------ G acima  -----------------------------------

;------------------------------ H abaixo -----------------------------------
;------------------------------ H acima  -----------------------------------

;------------------------------ I abaixo -----------------------------------
;------------------------------ I acima  -----------------------------------

;------------------------------ J abaixo -----------------------------------
;------------------------------ J acima  -----------------------------------

;------------------------------ K abaixo -----------------------------------
;------------------------------ K acima  -----------------------------------

;------------------------------ L abaixo -----------------------------------
;------------------------------ L acima  -----------------------------------


(defun main()
    (write-line (write-to-string (soma minhaArvore)))
    (write-line (write-to-string (buscaElemento minhaArvore 35)))
    (write-line (write-to-string (buscaElemento minhaArvore 36)))
    (write-line (write-to-string (minimoElemento minhaArvore)))
    (write-line (write-to-string (incrementa minhaArvore 2))) ; NOTE QUE A ARVORE TODA MUDA AQUI
    (write-line (write-to-string minhaArvore))
    (write-line "A )")
    (write-line (write-to-string (ocorrenciasElemento minhaArvore 14) ))
    (write-line (write-to-string (ocorrenciasElemento minhaArvore 57) ))
    (write-line "B )")
    (write-line (write-to-string (maioresQueElemento minhaArvore 65) ))
    (write-line "C )")
    (write-line (write-to-string (mediaElementos minhaArvore) ))
)

(main)
