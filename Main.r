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
# 5) El título del histrograma
# 6) El rango de valores a tomar para el eje x
hist(edad, xlab = "Edad", ylab = "Frecuencia Absoluta", col = "yellow", main = "Histograma de Edad", xlim = range(10,40))

# Creamos un diagrama de caja y bigotes de la variable "edad"
# Se le pasan los siguientes párametros por valor:
# 1) Los datos a renderizar
# 2) 

boxplot(edad, horizontal = TRUE, main = "EDAD 1.5", range = 1.5)
#Usamos un stripchart para visualizar mejor los valores y dandonos cuenta de que existen varios valores atipicos
stripchart(edad, method = "jitter", pch = 19, add = TRUE, col = "blue")


#Creamos otro diagrama para verificar el rango con un 0.5
boxplot(edad, horizontal = TRUE, main = "EDAD 0.5", range = 0.5)
#Usamos un stripchart para visualizar mejor los valores y dandonos cuenta de que existen varios valores atipicos al cambiar el range a 0.5

stripchart(edad, method = "jitter", pch = 19, add = TRUE, col = "red")

#Al cambiar el rango las conclusiones varian bastante

#cuarto punto
#resumen de la variable "calificacion"con la funcion summary
 
summary(calificacion)

#resumen de la variable "calificacion" de forma individual

length(calificacion)
class(calificacion)
mode(calificacion)

#quinto punto
#Creamos la variable "estatura" y la pasamos a int
estatura <- as.numeric(DATOS_ESTUDIANTES$`ESTATURA(M)`)
#Sacamos la media de la variable "estatura"
mean(estatura)
#sacamos la varianza de la variable "estatura"
var(estatura)
#Sacamos la desviacion estandar
sd(estatura)







        
      


