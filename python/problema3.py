'''
3. Crie uma expressão Lambda que compute o n-ésimo número de Fibonacci.
 Leia n do teclado.
'''
num = int(input("entre com numero\n"))
print("Fibbonacci desse numero eh "+str(
(lambda f: f(f)) (lambda f, i=0, fibz=0, fib=1: fibz if i==num else f(f,i+1,fib,fibz+fib))
))
