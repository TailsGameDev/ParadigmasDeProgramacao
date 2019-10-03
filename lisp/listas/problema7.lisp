#|
Crie uma fun ̧c ̃ao com assinaturaenesimo, a qual recebe uma lista de inteiros e
um inteirone retorna on- ́esimo elemento na lista.N ̃ao utilizenenhuma fun ̧c ̃ao
pronta to LISP para esta tarefa.
|#

(defun enesimo (lista n)
  (cond
    ( (null lista) 0 )
    ( (<= n 0) (car lista) )
    ( t (enesimo (cdr lista) (- n 1)) )
  )
)

(defun main ()
  (write-line (write-to-string (enesimo '(1 2 3 2) 2 ) ) )
)

(main)
