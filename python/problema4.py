'''
4. Crie uma expressão Lambda que resolva uma equação de segundo grau da forma
 ax 2 + bx + c utilizando a fórmula de Bhaskara.
  Leia os coeficientes a, b e c do teclado.
'''

a = float(input("Entre com 'a' \n"))
b = float(input("Entre com 'b' \n"))
c = float(input("Entre com 'c' \n"))

texto = "Digamos q x = 4. Nesse caso ax^2 + bx + c == "

print(texto+str((lambda x,x1,x2,x3: x1*x*x + x2*x + x3) (4,a,b,c)))
