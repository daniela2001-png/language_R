import random
import tweepy
import pandas as pd
import requests
import json

# Primer punto
def primer_punto():
    a = []
    i = 0
    while i >= 0:
        i = int(input("Introduce un número: "))
        a.append(i)
    return a[:-1]

# Segundo Punto
def punto_dos():
    lista1 = []
    lista2 = []
    print(" --- Introduce un número entero ---")
    for _ in range(1, 6):
        lista1.append(int(input("Introduce un numero: ")))
    print("--- Introduce otro número entero ---")
    for _ in range(1, 6):
        lista2.append(int(input("Introduce un numero: ")))
    lista3 = lista1 + lista2
    return lista3

#Tercer punto
def tercer_punto():
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    maximos = []
    minimos = []
    for i in range(1, 6):
        minx = float(input("minímo del dia {}: ".format(i)))
        minimos.append(minx) 
        max = float(input("máximo del dia {}: ".format(i)))
        maximos.append(max)
    diccionario = dict(zip(dias,zip(minimos,maximos)))
    for dia in dias:
        print("La temperatura media del {} es {} grados".format(dia, (diccionario[dia][0] + diccionario[dia][1]) / 2))

    minima = min(minimos)
    print("Los días con la temperatura más baja son:")
    for dia in dias:
        if diccionario[dia][0] == minima:
            print(dia)
    temperatura = float(input("Introduce una temperatura alta de los próximos días: "))
    maxima = temperatura
    print("Los días que coinciden con la temperatura alta de los próximos días son:")
    for dia in dias:
        if diccionario[dia][1] == maxima:
            print(dia)
        else :
            print("{}:No hay coincidencias".format(dia))

# Cuarto punto
def cuarto_punto():
    print("Este es un juego de adivinar un numero del 1 al 100, en el cual tienes 10 intentos")
    numero = random.randint(1, 100)
    intentos = 10
    while intentos > 0:
        adivina = int(input("Adivina el número: "))
        intentos -= 1
        if adivina == numero:
            print("Perfecto lo adivinaste en el intento número {} felicidades!".format(intentos))
            break
        elif adivina < numero:
            print("El número es mayor que ", adivina)
        elif adivina > numero:
            print("El número es menor que", adivina)
        if intentos == 0:
            print("Haz alcanzado el limite de veces, perdiste")
            print("El número era el ", numero)


#Quinto punto
def quinto_punto():
    #Inicializamos variables
    tweets = None
    tweets_dict = None
    tweets_data = None
    df = None
    #definimos una variables que contendrá las credenciales de la api
    client = tweepy.Client(consumer_key = "WGYa7ZiOblDsE6v3jYdtwjAYg",
                        consumer_secret = "N5oU1p9beN2VDckBC2dtv0JB3XYVxigiebsOwwkOraivDi13L3",
                        access_token = "775441596598870020-inxj9ON3b37F5l47VF0AjlUSewBxy5s",
                        access_token_secret = "4p4I8a5XGXbSFRZduFyYo7dg6Cp82kbc9FfaCfYHpNlll",
                        bearer_token = "AAAAAAAAAAAAAAAAAAAAADJwbQEAAAAAyeUcueaGdGnE5EpG8rOyBkrBr78%3DHGF1mY0uDJvqc6o8aRKxzQoYo6obdr1r1WeGqUH6SWLChJpdpC",
                        return_type = requests.Response,
                        wait_on_rate_limit=True)
    #Aquí irá el usuario que buscaremos solo cambiamos lo que está dentro de las comillas dobles
    UsuarioABuscar = input("Escribe un usuario de twitter válido: ")
    
    #get max. 20 tweets
    tweets = client.search_recent_tweets(query=f"from:{UsuarioABuscar} -is:retweet", 
                                        tweet_fields=['author_id', 'created_at'],
                                        max_results=20)
    # Save data as dictionary
    tweets_dict = tweets.json() 
    # Extract "data" value from dictionary
    tweets_data = tweets_dict['data']
    # Transform to pandas Dataframe
    df = pd.json_normalize(tweets_data)
    #Mostramos los 20 últimos Tweets
    print("="*60)
    print(f'Del usuario: {UsuarioABuscar}, hemos encontrado los siguientes últimos 20 Tweets')
    print("="*60)
    print(df['text'])


def menu():
    print(
    """
    --- Actividad en Python --- :\n
    \t 1) Ejercicio #1\n
    \t 2) Ejercicio #2\n
    \t 3) Ejercicio #3\n
    \t 4) Ejercicio #4\n
    \t 5) Ejercicio #5\n
    \t 6) Salir\n
    """
    )

def main():
    """
    Función que llamará a las demás funciones con los distintos ejercicios
    """
    menu()
    opc = int(input("Selecione una opción: \n"))
    while (opc >= 1 and opc <= 5):
        if (opc==1):
            print("Ejercicio #1")
            list_numbers = primer_punto()
            print(list_numbers)
            opc = int(input("Selecione una opción del menú del inicio\n"))
        elif(opc==2):
            print ("Ejercicio #2")
            listas = punto_dos()
            print(listas)
            opc = int(input("Selecione una opción del menú del inicio\n"))
        elif(opc==3):
            print("Ejercicio #3")
            tercer_punto()
            opc = int(input("Selecione una opción del menú del inicio\n"))
        elif(opc==4):
            print("Ejercicio #4")
            cuarto_punto()
            opc = int(input("Selecione una opción del menú del inicio\n"))
        elif(opc==5):
            print("Ejercicio #5")
            quinto_punto()
            opc = int(input("Selecione una opción del menú del inicio\n"))
        else:
            break
main()