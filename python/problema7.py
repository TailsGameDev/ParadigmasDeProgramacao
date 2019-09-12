'''
7. Utilize a função map que receba como parâmetros uma sequência numérica e uma
 função lambda. A função lambda deve retornar par ou ı́mpar para cada número.
'''

paridade = map(lambda e: "par" if e%2 == 0 else "impar", [2,3,4,5,6,7])
print(list(paridade))
