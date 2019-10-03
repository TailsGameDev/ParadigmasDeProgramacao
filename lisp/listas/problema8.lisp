#|
8.  Crie uma fun ̧c ̃ao com assinaturafatia, a qual recebe uma lista de inteiros,
um inteirone um inteirome retorna todos os elementos da lista a partir da
posi ̧c ̃aon(inclusive) at ́e a posi ̧c ̃aom(exceto o elementoda posi ̧c ̃aom).N ̃ao
utilizenenhuma fun ̧c ̃ao pronta to LISP para esta tarefa.
|#

(defun fatia (lista n m)
  (cond
    ( (null lista) () )
    ( (<= m 0) () )
    ( (<= n 0) (cons (car lista) (fatia (cdr lista) (- n 1) (- m 1) )) )
    ( t ( fatia (cdr lista) (- n 1) (- m 1) ) )
  )
)

(defun main ()
  (write-line (write-to-string (fatia '(1 2 3 2) 1 3 ) ) )
)

(main)
