'''
Crie uma express ̃ao Lambda que dados dois pontos no espa ̧co 3D, (x1, y1, z1)
e (x2, y2, z2), compute adistancia entre eles.
  Leia as posicoes dos pontos do teclado.
'''

x1 = int(input("entre com x1\n"))
y1 = int(input("entre com y1\n"))
z1 = int(input("entre com z1\n"))
x2 = int(input("entre com x2\n"))
y2 = int(input("entre com y2\n"))
z2 = int(input("entre com z2\n"))

print("A distancia entre os pontos eh: "+str(
( lambda x1,y1,z1,x2,y2,z2: ( (x2-x1)**2+(y2-y1)**2+(z2-z1)**2 )**.5 ) (x1,y1,z1,x2,y2,z2)
))
