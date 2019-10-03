#|
{-
Crie uma função com assinatura mapear :: (t -> y) -> [t] -> [y], a qual recebe uma função, uma
lista e retorna uma lista. Esta função mapear fará o mesmo que a função map, ou seja, aplicar a função
recebida como parâmetro sobre cada elemento da lista e retornar a lista resultante. Não utilize map ou
filter para esta tarefa.
-}
plus:: t -> Int
plus k = 3

mapear :: (t -> y) -> [t] -> [y]
mapear f l1 = [(f a) | a <- l1]

main = do
  print( (mapear plus [2,3,4,5]) )

|#
(defun filtrar (f lista)
  (if (null lista)
    ()
    (if (funcall f (car lista))
    (cons (car lista) (filtrar f (cdr lista)))
    (filtrar f (cdr lista))
    )
  )
)

(defun soma (a)
  (+ a 1)
)

(defun vdd (a)
  (= 2 2)
)

(defun mapear (f lista)
  (cond
    ( (null lista) () )
    ( t (cons (funcall f (car lista)) (mapear f (cdr lista))  ) )
  )
)


(defun main ()
  (write-line (write-to-string (mapear 'soma '(1 2 3 2) ) ) )
)

(main)
