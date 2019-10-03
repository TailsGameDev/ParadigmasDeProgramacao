#|
{-
Crie uma função com assinatura apagar :: Int -> [t] -> [t], a qual recebe um número de elementos,
uma lista, e retorna uma lista. Esta função deve remover da lista os n primeiros elementos fornecidos
como parâmetro. Por exemplo, a chamada (apagar 3 [1,2,3,4,5]) deve retornar [4,5]. Não utilize
nenhuma função pronta to Haskell para esta tarefa.
-}
apagar :: Int -> [t] -> [t]
apagar 0 l = l
apagar i (a:b) = (apagar (i-1) b)

main = do
  print( (apagar 3 [1,2,3,4,5,6]) )
|#

(defun apagar (n lista)
  (cond
    ( (null lista) () )
    ( (>  n 0) ( apagar (- n 1) (cdr lista) )  )
    ( (<= n 0) (cons (car lista) (apagar (- n 1) (cdr lista)) ) )
  )
)


(defun main ()
  (write-line (write-to-string (apagar 2 '(1 2 3 2) ) ) )
)

(main)
