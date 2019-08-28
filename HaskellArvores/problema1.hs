{-
Crie um tipo de dados Aluno, usandotype, assim como criamos um tipo de dados Pessoa.
  O tipo Alunodeve possuir um campo para o nome,  outro para a disciplina e outros trˆes campos para notas.
    Agora,execute os passos abaixo:
    A:Crie uma fun ̧c ̃ao no mesmo estilo que a fun ̧c ̃ao pessoa, vista em sala e
    dispon ́ıvel nos slides no Moodle,ou seja, que receba um inteiro e retorne um
    Aluno correspondente ao valor inteiro.

    B:Crie alguns alunos de exemplo, assim
    como tamb ́em feito no exemplo da pessoa.
    C:No  main,  imprima  o  primeiro  nome
      de  um  aluno,  portanto  crie  uma  fun ̧c ̃ao  para  obter  o  primeironome.
      D:Crie uma fun ̧c ̃ao que receba um Int e retorne a m ́edia do aluno correspondente.
      E:Crie uma fun ̧c ̃ao que calcule a m ́edia da turma, ou seja, considerando todos os alunos.
        DICA:  crieuma fun ̧c ̃ao recursiva que receba o primeiro identificador de
         aluno e incremente o identificador a cadachamada recursiva, at ́e chegar
         no  ́ultimo aluno.  N ̃ao use listas!
-}

type Nome = String
type Disciplina = String
type Nota = Float
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

qtddAlunos = 2

aluno :: Int -> Aluno
aluno 1 = ("Caina", "Paradigmas", 10, 10, 10)
aluno 2 = ("Josiscreudo", "Algoritmos", 5,6,2)

getNome :: Aluno -> String
getNome (n, _,_,_,_) = n

getMedia :: Aluno -> Float
getMedia (_,_,a,b,c) = (a+b+c)/3

media :: Int -> Float
media a = getMedia (aluno a)

somaMedias :: Int -> Float
somaMedias 1 = media 1
somaMedias n = ( media n ) + ( somaMedias (n-1) )

mediaTurma :: Float
mediaTurma = (somaMedias qtddAlunos) / (fromIntegral qtddAlunos)

toFloat :: Int -> Float
toFloat 0 = 0
toFloat x = 1.0 + (toFloat x-1)

main = do
  print( (mediaTurma) )
