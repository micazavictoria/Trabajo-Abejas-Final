
# Librerías ---------------------------------------------------------------
#Aca poner todas las liberiras que vaya usando
library(readr)

# Cargar datos ------------------------------------------------------------
# Datos obetenidos de: https://github.com/fonturbel-lab/pollination_catalogue/tree/master

datos <- read_delim("dataset/pollination_catalogue.csv", delim = ";") %>%
  drop_na()

glimpse(datos)


#Tiene varios na mi dataset, para pensar
#deberia quizaas filtrar las columnas que si voy a utilizar y depues dropiar los NA?
# voy a filtrar las columnas 
