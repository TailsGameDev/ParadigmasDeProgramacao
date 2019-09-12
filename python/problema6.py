'''
Crie uma expressao Lambda que receba 3 valores numericos (a, b, c)
 e retorne o maior deles. Nao utilizenenhuma forma de ordenação.
   Leia os valores a, b, c do teclado.
'''

a = int(input("entre com a\n"))
b = int(input("entre com b\n"))
c = int(input("entre com c\n"))

print( "O maior que digitaste foi: "+str( 
(lambda a,b,c: (lambda a,b: a if a>b else b) (a,b) if (lambda a,b: a if a>b else b) (a,b) > c else c) (a,b,c)
))
