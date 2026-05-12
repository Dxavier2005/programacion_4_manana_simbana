contador =1
while (contador<=5):
    print(f"contador: {contador}")
    contador +=1

    print("Continue")
    i=1
    while i<=5:
        if i==3:
            i+=1
            continue
        print(f"i: {i}")
    print("Break")
    i=1
    while (i<=5):
        i+=1
        if i==3:
            break
        print(f"contador: {i} ")

    numero =(input("Ingrese un numero:"))
    while numero != 0:
        print (f"Ingresaste: {numero}")
        numero =int(input("Ingrese un numero:"))

    contador=1
    while contador<=5:
        print(f"contador: {contador}")
        contador +=1
    else:
        print("fin del ciclo")

    contador=1
    