# * Yeinmy Daniela Morales Barrera - ymoral35@ibero.edu.co - 100116235
# * Deivid Steven Rojas Peña - drojasp4@ibero.edu.co - 100119296
# * Luis Carlos Castiblanco Fonseca - lcasti58@ibero.edu.co - 100113602

#Importamos las librerías que usaremos a lo largo del proyecto
import random
import tweepy
import pandas as pd
import requests
import json

# Primer punto
def primer_punto():
    #Primero creamos la lista y la asignamos a una variable
    a = []
    #Creamos una variable que se va a almacenar en la lista
    i = 0
    #Creamos un ciclo donde le pedimos al User introducir un número y lo insertará en la lista
    while i >= 0:
        i = int(input("Introduce un número: "))
        a.append(i)
    #Si se da un número negativo la lista se imprime con los valores positivos anteriores al negativo dado por el User
    return a[:-1]

# Segundo Punto
def punto_dos():
    #Definimos las listas donde se guardarán máximo 5 registros
    lista1 = []
    lista2 = []
    print(" --- Introduce un número entero ---")
    #Creamos el primer ciclo que hará la inserción en lista1
    for _ in range(1, 6):
        lista1.append(int(input("Introduce un numero: ")))
    print("--- Introduce otro número entero ---")
    #Creamos el segundo ciclo que hará la inserción en lista2
    for _ in range(1, 6):
        lista2.append(int(input("Introduce un numero: ")))
    #Concatenamos las listas 1 y 2 en lista 3 y la retornamos
    lista3 = lista1 + lista2
    return lista3

#Tercer punto
def tercer_punto():
    #Definimos la variable "dias" que contendrá los primeros 5 días de la semana como una lista
    dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]
    #Creamos dos variables que contendrán las listas de máximos y mínimos vácias para después hacer la inserción
    maximos = []
    minimos = []
    #iteramos en un rango de 5 para cada día los valores máximos y mínimos, estos valores se agregarán a las variables anteriores
    for i in range(1, 6):
        minx = float(input("minímo del dia {}: ".format(i)))
        minimos.append(minx) 
        max = float(input("máximo del dia {}: ".format(i)))
        maximos.append(max)
    #Creamos un diccionario que tendrá para cada día los mínimos y máximos
    diccionario = dict(zip(dias,zip(minimos,maximos)))
    #Itera por cada día e imprime la temperatura media de cada uno de los días
    for dia in dias:
        print("La temperatura media del {} es {} grados".format(dia, (diccionario[dia][0] + diccionario[dia][1]) / 2))
    #Definimos la variable mínima que contendrá las temperaturas más bajas
    minima = min(minimos)
    print("Los días con la temperatura más baja son:")
    #Iteramos e imprimimos el día con menor temperatura 
    for dia in dias:
        if diccionario[dia][0] == minima:
            print(dia)
    #Recibimos una temperatura más
    temperatura = float(input("Introduce una temperatura alta de los próximos días: "))
    maxima = temperatura
    print("Los días que coinciden con la temperatura alta de los próximos días son:")
    #Iteramos para verificar el día que tiene la coincidencia y si no hay mostramos en pantalla que no hay coincidencias 
    for dia in dias:
        if diccionario[dia][1] == maxima:
            print(dia)
        else :
            print("{}:No hay coincidencias".format(dia))

# Cuarto punto
def cuarto_punto():
    #Damos la introducción del ejercicio
    print("Este es un juego de adivinar un numero del 1 al 100, en el cual tienes 10 intentos")
    #Generamos un número aleatorio entre 1 y 100 y lo guardamos en la variable numero
    numero = random.randint(1, 100)
    #Definimos el número de intentos igual a 10
    intentos = 10
    #Creamos un ciclo que verifica si aún hay intentos disponibles
    while intentos > 0:
        #El User introduce el número que piensa es el correcto
        adivina = int(input("Adivina el número: "))
        #Se resta un intento a la variable
        intentos -= 1
        #En caso de adivinar el número se muestra el mensaje de felicitaciones y se muestra el intento en el cual consiguió acertar y finaliza con un break
        if adivina == numero:
            print("Perfecto lo adivinaste en el intento número {} felicidades!".format(intentos))
            break
        #Si el número introducido es menor al número a adivinar, se avisará que el número a adivinar es mayor
        elif adivina < numero:
            print("El número es mayor que ", adivina)
        #Si el número introducido es mayor al número a adivinar, se avisará que el número a adivinar es menor
        elif adivina > numero:
            print("El número es menor que", adivina)
        #Si el número de intentos se cero se finaliza la dinámica y se avisa del número que debía adivinar
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
    #definimos una variable que contendrá las credenciales de la api para poder hacer la consulta
    client = tweepy.Client(consumer_key = "WGYa7ZiOblDsE6v3jYdtwjAYg",
                        consumer_secret = "N5oU1p9beN2VDckBC2dtv0JB3XYVxigiebsOwwkOraivDi13L3",
                        access_token = "775441596598870020-inxj9ON3b37F5l47VF0AjlUSewBxy5s",
                        access_token_secret = "4p4I8a5XGXbSFRZduFyYo7dg6Cp82kbc9FfaCfYHpNlll",
                        bearer_token = "AAAAAAAAAAAAAAAAAAAAADJwbQEAAAAAyeUcueaGdGnE5EpG8rOyBkrBr78%3DHGF1mY0uDJvqc6o8aRKxzQoYo6obdr1r1WeGqUH6SWLChJpdpC",
                        return_type = requests.Response,
                        wait_on_rate_limit=True)
    #Se solicita el usuario del cual extraeremos los últimos 20 tweets, *deben haber tweets recientes para poder usar la api*
    UsuarioABuscar = input("Escribe un usuario de twitter válido: ")
    
    #Definimos una variable que hará la búsqueda del usuario y traerá los 20 tweets
    tweets = client.search_recent_tweets(query=f"from:{UsuarioABuscar} -is:retweet", 
                                        tweet_fields=['author_id', 'created_at'],
                                        max_results=20)
    #Guardamos los resultados con ayuda de la librería json
    tweets_dict = tweets.json() 
    #extraemos la data y la guardamos en una nueva variable
    tweets_data = tweets_dict['data']
    #Guardamos esos tweets en un dataframe para que se vea más ordenado
    df = pd.json_normalize(tweets_data)
    #Mostramos los 20 últimos Tweets solamente con esa columna que contiene los valores encontrados y la imprimimos
    print("="*60)
    print(f'Del usuario: {UsuarioABuscar}, hemos encontrado los siguientes últimos 20 Tweets')
    print("="*60)
    print(df['text'])

#Creamos un menú con opciones para mayor comodidad con la visualización de los ejercicios 
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

#Definimos una función que traerá la función de menú que creamos anteriormente y también los ejercicios anteriormente desarrollados
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
