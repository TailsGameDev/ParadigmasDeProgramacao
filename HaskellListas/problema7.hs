{-
Motifique o arquivoalunos.hs(dispon ́ıvel no Moodle) de forma a
 adicionar novas fun ̧c ̃oes:
 A:Crie uma fun ̧c ̃ao com a seguinte
  assinatura: aprovados ::  [(Int, String, Float)] -> [String],a qual
   recebe uma lista de alunos e retorna uma lista com o nome dos alunos
    aprovados.  Um alunoest ́a aprovado se a sua m ́edia  ́e maior
     ou igual a 6.  Utilizemapefilterpara resolver esta quest ̃ao.
     B:Crie uma fun ̧c ̃ao com a seguinte assinatura:
     aprovados2 ::  [(Int, String, Float)] -> [String],a qual recebe
      uma lista de alunos e retorna uma lista com o nome dos alunos
       aprovados.  Um alunoest ́a  aprovado  se  a  sua  m ́edia   ́e
         maior  ou  igual  a  6.   N ̃ao utilizemapefilterpara
         resolver  estaquest ̃ao.Utilizeo conceito delist
          comprehension.C:Utilize  (e  modifique,  se  necess ́ario)
            a  fun ̧c ̃aogerarParesvista  em  aula  e  dispon ́ıvel
              no  arquivoalunos.hspara formar duplas de alunos.
               Note que um aluno n ̃ao pode fazer dupla consigo mesmo.
-}

alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [t] -> [u] -> [(t,u)]
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

aprovado :: (Int, String, Float) -> Bool
aprovado (i, nome, media) = media >= 6

aprovados ::  [(Int, String, Float)] -> [String]
aprovados lista =  ( map getNome (filter (aprovado) lista) )
{-
aprovados [] = []
aprovados ( (i,nome,media) : b ) =
  if ( media >= 6 ) then
    nome : (aprovados b)
  else
    aprovados b
-}

--aprovados2 ::  [(Int, String, Float)] -> [String]

main = do
    print (aprovados alunos)
