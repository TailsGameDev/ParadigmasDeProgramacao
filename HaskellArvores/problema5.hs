{-
.  Pesquise o que  ́e o newtype.  Qual  ́e a diferen ̧ca dele para otypee para
odata?  Fa ̧ca um pequenoexemplo de aplica ̧c ̃ao e explique seu funcionamento.
-}

--referencia https://www.reddit.com/r/haskell/comments/5z5bcy/newtype_vs_data/
{-
newtipe e data sao bastante parecidos, mas o newtipe aceita apenas um construtor
neh, nao eh possivel daí fazer uma 'Forma', que tenha construtor para Circulo,
Quadrado e Triangulo. O newtipe corresponde completamente ao tipo referido,
enquanto o data tem alguma consideracao a mais que nao pude compreender totalmente.
Consegui um codigo que exemplifica um caso onde usar o newtipe nao resulta em erro
mas usar o data resulta. Provavelmente porque o compilador entendeu que o newtipe
deveria ser considerado como um Int, e o data continuou indefinido no metodo
que o utilizava usando a keyword undefined
-}

normal = case undefined of
  _ -> "pode cre"



newtype Y = Y Int

bar :: undefined -> String
bar q = case undefined of
  Y _ -> "This will not"



data X = X Int

foo :: undefined -> String
foo q = case undefined of
  X _ -> "This will error"


main = do
  print( (normal) )
  print( (bar 2) )
  print( (foo 2) ) -- esse da erro em tempo de execucao
