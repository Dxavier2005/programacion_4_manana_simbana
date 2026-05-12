# Enteros, Cadena de caracteres, booleanos, None

nombre= " Ana Garcia" # string
edad=28               # int
altura=1.65           #float 
activo=True           #bool 
nulo=None             #NoneType 

print(type(nombre))
print(type(edad))
print(type(altura))
print(type(activo))
print(type(nulo))

# ASIGNAR VALOR A VARIAS VARIABLES EN UNA LINEA

a, b, c = 12, 13 , 14

print(a)
print(b)
print(c)


# ASIGNAR EL MISMO VALOR A VARIAS VARIABLES


a, b, c = 0

print(a)
print(b)
print(c)


#INTERCAMBIAR VALORES

x,y = 10,20
print(x,y)
x,y=y,x
print(x,y)

#CONVENCIONES DE NOMBRES

nombre_completo="RAfael Urdaneta" # snake_case
nombreCompleto="RAfael Urdaneta" #  No usar camelCase
MAX_REINTENTOS=3                 # Mayusculas sostenidadas para
_variables_interna="privada"     #para uso interno  


#MANEJO DE ENTEROS

pequeno = 42
negativo= -17
grande= 1_000_000_000_000
enorme= 2 ** 100

print(pequeno)
print(negativo)
print(grande)
print(enorme)

#BASE NUMERICAS
binario=0b1010
octal=0o17
hexadecanal=0xFF
print(binario,octal, hexadecanal)


#CONVERTIR DE DECIMAL A OTRAS BASES

print(bin(255))
print(oct(255))
print(hex(255))


