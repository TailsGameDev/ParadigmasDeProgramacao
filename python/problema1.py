'''
1. Crie uma expressão Lambda que receba dois valores booleanos (x, y) retorne o resultado do “ou exclusivo”
(XOR) sobre eles. Leia os valores x e y do teclado.
'''
print("Xor do que tu digitou eh: "
+ str((lambda a,b : (a and (not b)) or ((not a) and b))
 ("T" == input("Entre com T ou F\n"), "T" == input("Entre com T ou F\n"))))
