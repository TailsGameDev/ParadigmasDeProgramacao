#|
alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 4.0)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getNota :: (Int, String, Float) -> Float
getNota (a,b,c) = c

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

--contem :: [t] -> t -> Bool


gerarPares :: Ord t => [t] -> [t] -> [(t,t)]
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2, a < b]
--estah gerando pares repetidos soh que mudando a ordem

aprovado :: (Int, String, Float) -> Bool
aprovado (i, nome, media) = media >= 6

aprovados ::  [(Int, String, Float)] -> [String]
aprovados lista =  ( map getNome (filter (aprovado) lista) )

aprovados2 ::  [(Int, String, Float)] -> [String]
aprovados2 [] = []
--aprovados2 [ (i,nome,media) ] = [b | b <- [nome], media>=6 ]--, media >=6 ]
aprovados2 lista = [ (getNome b) | b <- lista, (getNota b) >= 6]

{-
aprovados2 [] = []
aprovados2 ( (i,nome,media) : b ) =
  if ( media >= 6 ) then
    nome : (aprovados2 b)
  else
    aprovados2 b
-}

main = do
    print (gerarPares alunos alunos)
    --print (gerarPares alunos)
|#
(defun alunos()
    '((1 "Bob" (5.6 8 9.3))
      (2 "Ana" (8.2 9 7 6.5))
      (3 "Tom" (3.2 7 5.7 8.3))
      (4 "Bin" (7.5 5.3 8.5 6.2 3.1))
      (5 "Bia" (6.7 4.1 5.5)))
)

(defun getNome (aluno)
    (car (cdr aluno))
)

(defun getNomes (lista)
    (if (null lista)
        ()
        (cons (getNome (car lista)) (getNomes (cdr lista)))
    )
)

; ----------------------------------- A -------------------------------------
(defun comprimento (lista)
  (cond
    ( (null lista) 0 )
    ( t (+ 1 (comprimento (cdr lista) )) )
  )
)

(defun soma (lista)
  (cond
    ( (null lista) 0 )
    ( t (+ (car lista) (soma (cdr lista) )) )
  )
)

(defun media (lista)
  (/ (soma lista) (comprimento lista) )
)

(defun getNotas (aluno)
    (car (cdr (cdr aluno)) )
)

(defun A (lista) ;lista de alunos
  (cond
    ( (null lista) () )
    ( t
      (setq aluno (car lista))
      (setq medya (media (getNotas aluno)) )
      (setq tupla (cons (getNome aluno) medya) )
      (cons tupla (A (cdr lista)) )
    )
  )
)

; ----------------------------------- A -------------------------------------

(defun main ()
    (write-line (write-to-string (A (alunos) ) ))
)

(main)
