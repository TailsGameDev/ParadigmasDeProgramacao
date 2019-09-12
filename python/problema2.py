'''
Crie uma express ̃ao Lambda que receba trˆes notas de um aluno (a, b, c),
 calcule a m ́edia e retorne se oaluno foi aprovado ou reprovado.
   Para um aluno ser aprovado, ele deve possuir nota igual ou superior a6.
     Leia as notas dos alunos do teclado.
'''

m = []
for i in range(0,3):
    m.append(int(input("Digite uma nota\n")))
print("It's '" + str((lambda a,b,c : (a+b+c)/3 >= 6) (m[0],m[1],m[2])) + "' that the student was approved")
