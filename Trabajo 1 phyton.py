#primer punto
#Primero creamos la lista y la asignamos a una variable
#a = []
#Creamos una variable que se va a almacenar en la lista
#i = 0
#Creamos un bucle donde le pedimos al usuario introducir un numero, esto solo se detendra si el usuario inserta un numero negativo
#while i >= 0:
    #i = int(input("Introduce un numero: "))
    #a.append(i)

#print(a[:-1])

#segundo punto
'''
lista1 = []
o = 0
print("Introduce 5 numeros enteros")
for o in [1, 2, 3, 4, 5]:
    lista1.append(int(input("Introduce un numero: ")))



lista2 = []
e = 0
print("Introduce 5 numeros enteros de nuevo")
for e in [1, 2, 3, 4, 5]:
    lista2.append(int(input("Introduce un numero: ")))


lista3 = lista1 + lista2
print(lista3)




'''

#Tercer punto
'''
dias = ["lunes", "martes", "miercoles", "jueves", "viernes"]

maximos = []
minimos = []
for i in range(5):
    minx = float(input("minimo del dia {}: ".format(i+1)))
    minimos.append(minx)
    max = float(input("maximo del dia {}: ".format(i+1)))
    maximos.append(max)

diccionario = dict(zip(dias,zip(minimos,maximos)))
print(diccionario)

for dia in dias:
    print("La temperatura media del {} es {} grados".format(dia, (diccionario[dia][0] + diccionario[dia][1]) / 2))


minima = min(minimos)
print("Los dias con la temperatura mas baja son:")
for dia in dias:
    if diccionario[dia][0] == minima:
        print(dia)

temperatura = float(input("Introduce una temperatura alta de los proximos dias: "))

maxima = temperatura
print("Los dias que coinciden con la temperatura alta de los proximos dias son:")
for dia in dias:
    if diccionario[dia][1] == maxima:
        print(dia)

    else :
        print("{}:No hay coincidencias".format(dia, (diccionario[dia][0] )))

'''


#cuarto punto

'''
import random

print("Este es un juego de adivinar un numero del 1 al 100, en el cual tienes 10 intentos")
numero = random.randint(1, 100)
intentos = 10

while intentos > 0:
    adivina = int(input("Adivina el numero: "))
    intentos -= 1
    if adivina == numero:
        print("Perfecto lo adivinaste en el intento numero {} felicidades!".format(intentos))
        break
    elif adivina < numero:
        print("El numero es mayor que ", adivina)
    elif adivina > numero:
        print("El numero es menor que", adivina)


    if intentos == 0:
        print("Haz alcanzado el limite de veces, perdiste")
        print("El numero era el ", numero)'''


#Quinto punto


'''

#importamos las librerías
import tweepy
import pandas as pd
import requests
import json

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
UsuarioABuscar = str("petrogustavo")

#get max. 10 tweets
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
print(f'{"="*60}')
print(f'Del usuario: {UsuarioABuscar}, hemos encontrado los siguientes primeros 20 Tweets: ')
print(f'{"="*60}')
df['text']

'''


