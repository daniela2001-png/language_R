#Primer punto
#LLAMAMOS EN LA LIBRERIA LA HERRAMIENTA PARA LEER NUESTRO DOCUMENTO

library(readxl)

#INTRODUCIMOS LA BASE DE DATOS A TRABAJAR en una variable

DATOS_ESTUDIANTES <- read_excel("DATOS_ESTUDIANTES.xlsx")

#CREAMOS LA VARIABLE "calificacion" Y EXTRAEMOS LOS VALORES DE LA BASE DE DATOS PRINCIPAL

calificacion <- DATOS_ESTUDIANTES$CALIFICACION
calificacion

#CREAMOS LA VARIABLE "frecuencia_absoluta" PARA CREAR Y GUARDAR LA TABLA DE FRECUENCIA ABSOLUTA

frecuencia_absoluta <- table(calificacion)
frecuencia_absoluta

#DESPUES DE CREADA LA TABLA DE FRECUENCIA ABSOLUTA, CREAMOS LA TABLA DE FRECUENCIA RELATIVA Y LA GUARDAMOS EN LA VARIABLE "frecuencia_relativa"

frecuencia_relativa <- prop.table(x= frecuencia_absoluta)
frecuencia_relativa

#segundo punto
#instalamos y llamamos a la libreria ggplot2

library(ggplot2)

#creamos el diagrama de barras de la variable "ciudades"
ciudades <- DATOS_ESTUDIANTES$CIUDAD

barplot(table(ciudades), las = 2, col = 2:14, main = "Ciudades")

#creamos el diagrama de sectores de la variable "ciudades"

pie(table(ciudades), col = 1:14, main = "Ciudades")

#tercer punto
#Creamos un histograma de la variable "edad"

edad <- DATOS_ESTUDIANTES$EDAD
hist(edad, xlab = "edad", ylab = "Frecuencia", col = "yellow", main = "Histograma de edad", xlim = range(10,40))

#Creamos un diagrama de caja y bigotes de la variable "edad"

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



#segundo ejercicio
file.choose()
ruta_excel <- "C:\\Users\\Gaming\\Downloads\\GRCienciasDatos (1).xlsx"
GR1 <- read_excel(ruta_excel)
library(colourpicker)


colores <- scale_fill_manual(values = c("#00CFFF", "#FF00E7", "#3FF200", "#EDFC00"))
pie(table(GR1$`Grupo Sanguíneo`), col =  c("#00CFFF", "#FF00E7", "#3FF200", "#EDFC00"), main = "Grupo sanguineo GR1")


GR2 <- read_excel(ruta_excel, sheet = "GR2")
pie(table(GR2$`Grup0 Sanguíne0`), col =  c("#00CFFF", "#FF00E7", "#3FF200", "#EDFC00"), main = "Grupo sanguineo GR2")


#SEGUNDO PUNTO
Estatura <- GR1$Estatura

as.numeric(Estatura)
na.omit(Estatura)
hist(Estatura, xlab = "Estatura", ylab = "Frecuencia", col = "RED", main = "Histograma estatura GR1")

Estatura2 <- GR2$Estatura
as.numeric(Estatura2)
na.omit(Estatura2)
hist(Estatura2, xlab = "Estatura", ylab = "Frecuencia", col = "blue", main = "Histograma estatura GR2")

#TERCER PUNTO
EdadGR1 <- GR1$Edad
EdadGR2 <- GR2$Edad
boxplot(EdadGR1, horizontal = TRUE, main = "Dispersion y datos atipicos edad GR1")
boxplot.stats(EdadGR1, do.out = TRUE)
#Mediante esta funcion mas en especifico '$out' nos muestra que no existen valores atipicos en la variable 'EdadGR1'


boxplot(EdadGR2, horizontal = TRUE, main = "Dispersion y datos atipicos edad GR2")
boxplot.stats(EdadGR2, do.out = TRUE)
#Mediante esta funcion mas en especifico '$out' nos muestra que no existen valores atipicos en la variable 'EdadGR2'

#Cuarto punto
Estatura_GR1 <- GR1$Estatura
Estatura_GR1 <- na.omit(Estatura_GR1)
class(Estatura_GR1)


#sort.list(c(Estatura_GR1))
sort.list(c(1, 2, 3, 4, 5, 6, 7, 8, 9))

#quinto punto 
variable <- 1:20
plot(Estatura~variable, main="DISPERSION DE DATOS")
table(Estatura)


       

#septimo punto


library(quantmod)
library(tseries)
library(fImport)
#Asimetria
skewness(GR1$Edad)
hist(GR1$Edad)
mean(GR1$Edad)
abline(v=23.65,col="RED")

#curtosis
#Teniendo en cuenta que la distribucion normal de curtosis es 3
kurtosis(GR1$Edad, method = "moment")
hist(GR1$Edad)
mean(GR1$Edad)
abline(v=23.65,col="RED")








        
      


