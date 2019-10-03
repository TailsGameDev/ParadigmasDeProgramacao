#|
 Crie uma estrutura de dados para pontos 2D, a qual deve possuir os campos x e y.
 A:Crie  uma  fun ̧c ̃aodistancia (a b),  a  qual  recebe  dois  pontos  como
 parˆametro  de  deve  retornar  adistˆancia entre eles.
 B:Crie uma fun ̧c ̃ao
 colineares (a b c), a qual recebe trˆes pontos como parˆametro de deve
 retornarse  eles  s ̃ao  colineares  ou  n ̃ao.   DICA:   os  trˆes  pontos
 ser ̃ao  colineares  se  o  determinante  de  suascoordenadas for igual a 0.
 C:Crie uma fun ̧c ̃aoformaTriangulo (a b c), a qual recebe trˆes pontos como
 parˆametro de deve retor-nar se eles podem ser usados para formar um triˆangulo.
|#

(defstruct Ponto2D
  x
  y
)


;------------------------------ A abaixo -----------------------------------
(defun distancia (a b)
  ( expt ( + (expt (- (Ponto2D-x a) (Ponto2D-x b) ) 2) (expt (- (Ponto2D-y a) (Ponto2D-y b)) 2)  )  0.5   )
  ;( ( (Ponto2D-y b-Ponto2D-x a)**2 + (Ponto2D-y b-Ponto2D-y a)**2 ) ** 0.5 )
)
;------------------------------ A acima  -----------------------------------

;------------------------------ B abaixo -----------------------------------
; Ponto2D-x a Ponto2D-y a 1
; Ponto2D-x b Ponto2D-y b 1
; Ponto2D-x c Ponto2D-y c 1
(defun colineares (a b c)
  (setq esqParaDir (+ (* (Ponto2D-x a) (Ponto2D-y b)) (* (Ponto2D-y a) (Ponto2D-x c) ) (* (Ponto2D-x b) (Ponto2D-y c) ) ) )
  (setq dirParaEsq (+ (* (Ponto2D-y b) (Ponto2D-x c)) (* (Ponto2D-x a) (Ponto2D-y c) ) (* (Ponto2D-y a) (Ponto2D-x b) ) ) )
  (setq sub (- esqParaDir dirParaEsq) )
  (= 0 sub)
)
;------------------------------ B acima  -----------------------------------

(defun main ()
  ; A )
  (setq p1 (make-Ponto2D :x 0 :y 0) )
  (setq p2 (make-Ponto2D :x 1 :y 0) )
  (setq p3 (make-Ponto2D :x (- 0 1) :y 1) )
  (write-line (write-to-string (distancia p1 p2 ) ) )
  ; B )
  (write-line (write-to-string (colineares p1 p2 p3) ) )
)

(main)
