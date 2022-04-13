# Integrantes Del Grupo Actividad #5
# -----------------------------------
# * Yeinmy Daniela Morales Barrera - ymoral35@ibero.edu.co - 100116235
# * Deivid Steven Rojas Peña - drojasp4@ibero.edu.co - 100119296
# * Luis Carlos Castiblanco Fonseca - lcasti58@ibero.edu.co - 100113602



# ---- SEGUNDO EJERCICIO ----

# Importamos las librerías necesarias para poder ejecutar nuestro código
library(colourpicker)
library(readxl)
library("tidyverse")
library("dplyr")
library("car")
library(quantmod)
library(tseries)
library(fImport)



# --- PRIMER PUNTO ---- 

# Definimos la ruta donde se encuentran las tablas de excel
ruta_excel <- "/Users/dmoralesbarr/Dropbox/Mac/Desktop/LENGUAJE_R/language_R/GRCienciasDatos.xlsx"

# Leemos ambas tablas de excel
GR1 <- read_excel(ruta_excel)
GR2 <- read_excel(ruta_excel, sheet = "GR2")


# Creamos los plots a mostrar con los datos de los grupos sanguíneos de ambas tablas
# Dentro del parámetro "col" definimos los colores de los gráficos en hexadecimal
pie(table(GR1$`Grupo Sanguíneo`), col =  c("#00CFFF", "#FF00E7", "#3FF200", "#EDFC00"), main = "Grupo sanguíneo GR1")
pie(table(GR2$`Grup0 Sanguíne0`), col =  c("#00CFFF", "#FF00E7", "#3FF200", "#EDFC00"), main = "Grupo sanguíneo GR2")


# --- SEGUNDO PUNTO ---
# Asignamos a la variable Estatura los valores de la columna estatura
Estatura <- GR1$Estatura

# Hacemos limpieza de los datos omitiendo los valores nulos y 
# haciendo casteo de los datos de "carácter" a "númericos"
as.numeric(Estatura)
na.omit(Estatura)

# Renderizamos un histograma con los datos de la estatura de cada registro de una de las tablas
hist(Estatura, xlab = "Estatura", ylab = "Frecuencia", col = "RED", main = "Histograma estatura GR1")

# Asignamos a la variable Estatura los valores de la columna estatura
Estatura2 <- GR2$Estatura

# Hacemos limpieza de los datos omitiendo los valores nulos y 
# haciendo casteo de los datos de "carácter" a "númericos"
as.numeric(Estatura2)
na.omit(Estatura2)

# Renderizamos un histograma con los datos de la estatura de cada registro de una de las tablas
hist(Estatura2, xlab = "Estatura", ylab = "Frecuencia", col = "blue", main = "Histograma estatura GR2")



# --- TERCER PUNTO ---

# Definimos dos variables para almacenar los registros de las columnas Edades
# de ambas tablas
EdadGR1 <- GR1$Edad
EdadGR2 <- GR2$Edad

# Creamos una caja de bigotes para saber si contamos con datos atípicos o no
# Teniendo en cuenta nuestro gráfico y las estadistícas podemos decir que NO
# contamos con datos inferiores al minimo ni del máximo
boxplot(EdadGR1, horizontal = TRUE, main = "Dispersion y datos atípicos edad GR1")
# El método stripchart nos permite visualizar los puntos de cada dato
stripchart(EdadGR1, method = "jitter", pch = 19, add = TRUE, col = "blue")

# Mediante esta función mas en especifíco '$out' nos muestra que NO existen valores atipicos en la variable 'EdadGR1'
boxplot.stats(EdadGR1, do.out = TRUE)


# Creamos una caja de bigotes para saber si contamos con datos atípicos o no
# Teniendo en cuenta nuestro gráfico y las estadistícas podemos decir que NO
# contamos con datos inferiores al minimo ni del máximo
boxplot(EdadGR2, horizontal = TRUE, main = "Dispersion y datos atípicos edad GR2")
# El método stripchart nos permite visualizar los puntos de cada dato
stripchart(EdadGR2, method = "jitter", pch = 19, add = TRUE, col = "red")

# Mediante esta funcion mas en especifico '$out' nos muestra que no existen valores atipicos en la variable 'EdadGR2'
boxplot.stats(EdadGR2, do.out = TRUE)




# ---- CUARTO PUNTO ----

# ============= GR1 Valor máximo del 40% de las estaturas más pequeñas  ==============
# Se crea una variable que tendrá el dataframe de GR1 y se ordenan de menor a mayor borrando los NA ya que no hay data de esas estaturas
dfGR1 <- data.frame(GR1)
OrdenadoEstatura <- dfGR1 %>% arrange(Estatura)
dfGR1 <- drop_na(OrdenadoEstatura)

# Se cuentan los datos de la tabla GR1 
ConteoEstaturaconGR1 <- count(dfGR1)

# Se calcula el 40% es decir la cantidad de datos a tomar
round(40*ConteoEstaturaconGR1/100, digits = 0)

# Hay 18 datos contando por lo cual seleccionamos los 7 datos que equivalen al 40%
CuarentaPorcientoGR1 <- dfGR1[1:7,]
CuarentaPorcientoGR1

# Sacamos el valor máximo del 40% de las estaturas mínimas la cuál es 1.78
max(CuarentaPorcientoGR1$Estatura)


# ============= GR2 Valor mínimo del 30% de las estaturas mayores  ==============

# Se crea una variable que tendrá el dataframe de GR2 y se ordenan de mayor a menor
# borrando los valores nulos ya que no hay data de esas estaturas
dfGR2 <- data.frame(GR2)
OrdenadoEstatura2 <- dfGR2 %>% arrange(desc(Estatura))
dfGR2 <- drop_na(OrdenadoEstatura2)

# Se cuentan los datos de la tabla GR2
ConteoEstaturaconGR2 <- count(dfGR2)

# Se calcula el 30% es decir la cantidad de datos a tomar
round(30*ConteoEstaturaconGR2/100, digits = 0)

# Hay 18 datos contando por lo cual seleccionamos los 5 datos que equialen al 30%
CuarentaPorcientoGR2 <- dfGR2[1:5,]

# Sacamos el valor mínimo del 30% de las estaturas mayores la cuál es 1.83
min(CuarentaPorcientoGR2$Estatura)




# ----- QUINTO PUNTO ----- 

# Para verificar la Homocedasticidad de ambos dataframes y confirmar cuál es más homogéneo

# Hacemos el Test de Levene para GR1
leveneTest(y = GR1$Edad, group = GR1$Estatura, center = "median")

# Hacemos el Test de Levene para GR2
leveneTest(y = GR2$Edad, group = GR2$Estatura, center = "median")

# Se evidencia  que el grupo más homogéneo es el grupo A (GR1) ya que el Pr(F)
# es más próximo a cero o en este caso menor al grupo B (GR2), esto con ayuda 
# del método Levene



# ---- SEXTO PUNTO ----

# Definimos dos variables para poder almacenar las estaturas sin valores nulos
Estaturagr1 <- na.omit(GR1$Estatura)
Estaturagr2 <- na.omit(GR2$Estatura)


# Sacamos la media de las estaturas de ambos grupos o tablas
mean(Estaturagr1)
mean(Estaturagr2)
mean(Estaturagr1) < mean(Estaturagr2) # Es igual a TRUE
# Con esto nos podemos dar cuenta que la estatura media mayor pertenece al grupo B (GR2)


# Sacamos la mediana del grupo A (GR1) y B(GR2)
median(Estaturagr1)
median(Estaturagr2)
median(Estaturagr1) == median(Estaturagr2) # Es igual a TRUE
# Con esto nos podemos dar cuenta que la mediana en ambos grupos
# es la misma asi que no hay una mas pequeña que la otra



# ----- SÉPTIMO PUNTO ------

# Asimetría
skewness(GR1$Edad)
hist(GR1$Edad, main= "Asimetría de la edades")
mean(GR1$Edad)
abline(v=23.65,col="RED")

# Curtosis
# Teniendo en cuenta que la distribución normal de curtosis es 3
kurtosis(GR1$Edad, method = "moment")
hist(GR1$Edad,  main= "Curtosis de la edades")
mean(GR1$Edad)
abline(v=23.65,col="RED")



# ----- OCTAVO PUNTO -----
# Como conclusiones tenemos que existen varios tipos de curtosis
# que nos permite saber que tan "concetrada" o no está la distribución de
# nuestros datos a analizar, entre los ejercicios logramos identificar
# el tipo "Mesocúrtica" de curtosis, también repasamos cómo en el anterior
# ejercicio la caja de bigotes, histogramas, pie, como los distintos tipos de plots
# disponibles para poder exponer los datos preprocesados, y conocer si existen
# o no tambien los denominados valores atípicos.
