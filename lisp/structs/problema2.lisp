(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no
        :n 1
        :esq (make-no :n 1               ;pode omitir o NIL
                      :esq (make-no :n 1 :esq NIL :dir NIL)
                      :dir (make-no :n 1 :esq NIL :dir NIL)
             )
        :dir (make-no :n 1
                      :esq (make-no :n 1 :esq NIL :dir NIL)
                      :dir (make-no :n 1 :esq NIL :dir NIL)
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
    ((null arv) ())
    (t ; concaenate 'list (listas)
      (concatenate 'list
        (elementos (no-esq arv))
        (cons (no-n arv) ())
        (elementos (no-dir arv))
      )
    )
  )
)
;------------------------------ E acima  -----------------------------------

;------------------------------ F abaixo -----------------------------------
(defun substituir (arv x y)
  (cond
    ( (null arv) )
    ( (= (no-n arv) x)
      (progn
        (setf (no-n arv) y)
        (substituir (no-esq arv) x y)
        (substituir (no-dir arv) x y)
      )
    )
    ( (/= (no-n arv) x)
      (substituir (no-esq arv) x y)
      (substituir (no-dir arv) x y)
    )
  )
)
;------------------------------ F acima  -----------------------------------

;------------------------------ G abaixo -----------------------------------
(defun posordem (arv)
  (cond
    ((null arv) ())
    (t ; concaenate 'list (listas)
      (concatenate 'list
        (posordem (no-esq arv))
        (posordem (no-dir arv))
        (cons (no-n arv) ())
      )
    )
  )
)
;------------------------------ G acima  -----------------------------------

;------------------------------ H abaixo -----------------------------------
(defun emordem (arv)
  (elementos arv)
)
;------------------------------ H acima  -----------------------------------

;------------------------------ I abaixo -----------------------------------
(defun preordem (arv)
  (cond
    ((null arv) ())
    (t ; concaenate 'list (listas)
      (concatenate 'list
        (cons (no-n arv) ())
        (preordem (no-esq arv))
        (preordem (no-dir arv))
      )
    )
  )
)
;------------------------------ I acima  -----------------------------------

;------------------------------ J abaixo -----------------------------------
#|
(defun subtraiParesImpares (arv)
    (setq um 1)
    (cond
      ( (null arv) 0)
      ( (= (mod (no-n arv) 2) 0)
        (+
          (no-n arv)
          (soma (no-esq arv))
          (soma (no-dir arv))
        )
      )
      ( t
        (+
          (- (no-n arv))
          (+ (soma (no-esq arv)))
          (+ (soma (no-dir arv)))
        )
      )
    )
)
|#

(defun subpi (larv)
  (cond
    ( (null larv) 0)
    ( (= (mod (car larv) 2) 0) (+ (car larv) (subpi (cdr larv))) )
    ( t (+ (- (car larv)) (subpi (cdr larv))))
  )
)

(defun subtraiParesImpares (arv)
  (subpi (emordem arv))
)
;------------------------------ J acima  -----------------------------------

;------------------------------ K abaixo -----------------------------------
(defun novoNo (x)
  (make-no :n x)
)
;------------------------------ K acima  -----------------------------------

;------------------------------ L abaixo -----------------------------------
; O que eh um noh interno?
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
    (write-line "D )")
    (write-line (write-to-string (qtdElementos minhaArvore) ))
    (write-line "E )")
    (write-line (write-to-string (elementos minhaArvore) ))
    (write-line "F )")
    (substituir minhaArvore 54 2)
    (substituir minhaArvore 66 2)
    (write-line (write-to-string minhaArvore))
    (write-line "G )")
    (write-line (write-to-string (posordem minhaArvore) ))
    (write-line "H )")
    (write-line (write-to-string (emordem minhaArvore) ))
    (write-line "I )")
    (write-line (write-to-string (preordem minhaArvore) ))
    (write-line "J )")
    (write-line (write-to-string (subtraiParesImpares minhaArvore) ))
    (write-line "K )")
    (write-line (write-to-string (novoNo 6) ))
    (write-line "L )")
)

(main)
