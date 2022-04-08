# Integrantes Del Grupo Actividad #5
# -----------------------------------
# * Yeinmy Daniela Morales Barrera - ymoral35@ibero.edu.co - 100116235
# * Deivid Steven Rojas Peña - drojasp4@ibero.edu.co - 100119296
# * Luis Carlos Castiblanco Fonseca - lcasti58@ibero.edu.co - 100113602

# Importamos las librerías necesarias para poder ejecutar nuestro código
library(readxl)
library(ggplot2)


# ------- PRIMER PUNTO ---------
# Leemos nuestro archivo para poder manejar los datos desde una variable
# en este caso esta variable será llamada "datos_estudiantes"
datos_estudiantes <- read_excel("DATOS_ESTUDIANTES.xlsx")

# Creamos la variable calificacion para poder almacenar en la misma,
# todos los valores que tiene el campo o columna "calificacion" de nuestra tabla
Calificacion <- datos_estudiantes$CALIFICACION

# Asignamos a la variable "absolutas" la cantidad o "moda" por cada valor,
# de la columna "calificacion", en conclusión creamos nuestra tabla de frecuencia absoluta
absolutas <- table(Calificacion)

# Imprimimos por STDOUT el valor almacenado en la variable "absolutas"
absolutas

# Después de creada la tabla de frecuencia absoluta
# creamos la tabla de frecuencia relativa y la guardamos en la variable "relativas"
# para poder conocer la frecuencia absoluta respecto a el total (fr)
relativas <- prop.table(x=absolutas)

# Imprimimos por STDOUT el valor almacenado en la variable "relativas"
relativas

# ------ SEGUNDO PUNTO ------

# Asignamos a la variable "ciudades" los registros que contienen la columna "ciudades"
# desde nuestro excel local que ya leímos y almacenamos en "datos_estudiantes"
ciudades <- datos_estudiantes$CIUDAD

# Creamos nuestro diagrama de barras con ayuda del método barplot para la variable "ciudades"
# Se le pasan los siguientes párametros por valor:
# 1) Los datos que vamos a renderizar.
# 2) Modificamos la orientacion de las etiquetas respecto al eje, para que se perpendicular al mismo
#    esto para que los nombres de cada ciudad se logren renderizar de una manera fácil de 
#    interpretar.
# 3) Pasamos el rango a tomar del vector de colores disponibles para cada barra dentro del gráfico
# 4) Pasamos el título del gráfico
barplot(table(ciudades), las = 2, col = 2:14, main = "Ciudades")

# Creamos nuestro diagrama de sectores con ayuda del método "pie" de la variable "ciudades"
# Se le pasan los siguientes párametros por valor:
# 1) Los datos que vamos a renderizar
# 2) El rango a tomar para el vector de colores disponible para cada sector
# 3) Título del gráfico
pie(table(ciudades), col = 1:14, main = "Ciudades")


# ----- TERCER PUNTO ----- 

# Asignamos a la variable "edad" los registros contenidos en la columna "edad"
# que tenemos dentro de nuestro excel local
edad <- datos_estudiantes$EDAD

# Creamos el histograma para renderizar los valores de la variable "edad"
# Se le pasan los siguientes párametros por valor:
# 1) Los datos a renderizar
# 2) Una descripción para el eje x
# 3) Una descripción para el eje y
# 4) El color usado para cada "bin" dentro del histograma
# 5) El título del histograma
# 6) El rango de valores a tomar para el eje x
hist(edad, xlab = "Edad", ylab = "Frecuencia Absoluta", col = "yellow", main = "Histograma de Edad", xlim = range(10,40))


# Seteamos la opción de poder abrir la visualización de dos gráficos en una misma ventana
par(mfrow = c(2,1))

# Creamos un diagrama de caja y bigotes de la variable "edad"
# Se le pasan los siguientes párametros por valor:
# 1) Los datos a renderizar
# 2) Modificamos la orientacion del boxplot de vertical a horizontal
# 3) Definimos el título de la gráfica
# 4) Determina la extensión de los “whiskers” de la caja
# --------
# ¿Existe algún valor atípico en esta variable?
# Respondiendo a esta pregunta tenemos que:
# usando un stripchart para poder visualizar mejor los puntos de cada registro,
# y observando ambos extremos del boxplot, nos damos cuenta de que ninguno de estos puntos
# se sale de ambos extremos, que hablando puntualmente quiere decir que no hay una edad
# que se salga del rango entre los 17 y 35 años, es decir en este caso especifico
# NO contamos con valores atípicos cuando tenemos un rango de 1.5
boxplot(edad, horizontal = TRUE, main = "Edades", sub = "Edades con una extensión de 'whiskers' igual a 1.5 ", range = 1.5)
stripchart(edad, method = "jitter", pch = 19, add = TRUE, col = "blue")


# Ahora cambiando nuestro rango de 1.5 a 0.5 tenemos la siguiente pregunta:
# ¿ Las conclusiones varían ? dando una respuesta a la misma se tiene que
# con ayuda de nuestro boxplot en ese nuevo rango (0.5) efectivamente ya contamos
# con valores atípicos, comparado con el anterior boxplot que tenía un rango mayor
# estos valores fuera de los extremos pertenecen a las edades: [17, 34, 35] 
# esto lo podemos verificar con ayuda del método "stats" de boxplot
# en conclusión si modificamos el rango de 1.5 a 0.5 notamos que ya contaremos con 
# valores atípicos dentro de nuestro diagrama de caja y bigotes.
boxplot(edad, horizontal = TRUE, main = "Edades", sub="Edades con una extensión de 'whiskers' igual a 0.5", range = 0.5)
# Usamos un stripchart para visualizar mejor los valores
stripchart(edad, method = "jitter", pch = 19, add = TRUE, col = "red")

# Seteamos la opción de poder cerrar la visualización de dos gráficos en una misma ventana
par(mfrow = c(1,1))



# ---- CUARTO PUNTO -----

# En este cuarto punto nuestra misión será poder resumir brevemente
# información sobre el campo "calificacion" con ayuda del método summary
# que nos crea una "matriz", donde nos explica estadisticas básicas sobre 
# el vector pasado como párametro, los datos estadisticos que nos brinda este método
# son los siguientes, (ordenados por columnas) :
# 1) Min > Nos expresa en este caso la calificación mínima dentro de la columna
# 2) Primer Cuartil > Nos expresa el 25% de los datos
# 3) Mediana > Variable con posición central de los datos
# 4) Media > Razon entre la suma y total de datos
# 5) Tercer Cuartil > Representa el 75% de los datos
# 6) Max > Representa el valor máximo obtenido entre los registros del campo
summary(as.numeric(calificacion))

# Ahora verifiquemos si estas estadisticas dadas calculada de anera individual
# coinciden o no ..

# 1) Calculemos el valor mínimo del vector calificación
min(as.numeric(calificacion))
# Efectivamente el mínimo coincide con el valor retornado con ayuda del método summary

# 2) Calculemos el primer cuartil del vector calificación
primer_cuartil <- quantile(as.numeric(calificacion))
primer_cuartil[2]
# Validamos que el 25% de los datos tiene una calificación de 3.9

# 3) Calculemos la mediana de los datos
median(as.numeric(calificacion))
# La mediana de las datos es igual a 4.0

# 4) Caculemos la media de los datos
mean(as.numeric(calificacion))
# Validamos que la media de los datos es igual a 4.12 

# 5) Calculemos ahora el 3er Cuartil (75%)
tercer_cuartil <- quantile(as.numeric(calificacion))
tercer_cuartil[4]
# Validamos que el 75% de los datos tiene una calificación de 4.5

# 6) Calculemos el máximo valor que puede tomar el vector:
max(as.numeric(calificacion))
# El máximo coincide con el valor obtenido previamente con ayuda de summary



# ---- QUINTO PUNTO ----

#Creamos la variable "estatura" y la pasamos a int
estatura <- as.numeric(DATOS_ESTUDIANTES$`ESTATURA(M)`)
#Sacamos la media de la variable "estatura"
mean(estatura)
#sacamos la varianza de la variable "estatura"
var(estatura)
#Sacamos la desviacion estandar
sd(estatura)








        
      


