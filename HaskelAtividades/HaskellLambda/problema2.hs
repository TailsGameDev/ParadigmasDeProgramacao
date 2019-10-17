{-
Crie uma express ̃ao Lambda que receba trˆes notas de um aluno (a, b, c),
calcule a m ́edia e retorne se oaluno foi aprovado ou reprovado.
Para um aluno ser aprovado, ele deve possuir nota igual ou superior a6.
Leia as notas dos alunos do teclado.
-}
main = do
  print ( (\a b c -> if div (a+b+c) 3 >= 6 then "aprovado" else "reprovado" ) 4 6 7 )
