
# Filtrar datos -----------------------------------------------------------
#Filtrar Ordenes de polinizadores a utilizar
datos_filtrados <- filter(datos, 
                          order_animals %in% c("Hymenoptera", "Diptera", "Lepidoptera", 
                                               "Coleoptera", "Apodiformes", "Passeriformes"),
                          !is.na(state_province))  

#Estandarizamos los nombres de las regiones para el analisis y luego filtramos
datos_filtrados <- datos_filtrados %>%
  mutate(state_province = case_when(
    state_province %in% c("Araucania", "La Araucania") ~ "La Araucanía",
    state_province == "Aysen" ~ "Aisén del General Carlos Ibáñez del Campo",
    state_province == "Bio Bio" ~ "Bío-Bío",
    state_province == "Metropolitana de Santiago" ~ "Región Metropolitana de Santiago",
    state_province %in% c("O'Higgins", "Libertador General Bernardo O'Higgins") ~ "Libertador General Bernardo O'Higgins",
    state_province == "Tarapaca" ~ "Tarapacá",
    state_province == "Valparaiso" ~ "Valparaíso",
    state_province == "Los Rios" ~ "Los Ríos",
    state_province == "Magallanes" ~ "Magallanes y Antártica Chilena",
    TRUE ~ state_province
  ))

#Verificamos que los datos esten correctos 
count(datos_filtrados, order_animals, sort = TRUE)
count(datos_filtrados, state_province, sort = TRUE)


# Explorar datos ----------------------------------------------------------
#Abundancia de interacciones por orden 

abundancia_interacciones <- datos_filtrados %>%
  group_by(order_animals) %>%
  summarise(n_interacciones = n())

#Riqueza de especies por orden

riqueza <- datos_filtrados %>%
  group_by(order_animals) %>%
  summarise(n_especies = n_distinct(scientific_name_animals))

#Abundancia total por region

abundancia_regiones_total <- datos_filtrados %>%
  group_by(state_province) %>%
  summarise(n_interacciones = n())

#Abundancia de ordenes por region

abundancia_regiones <- datos_filtrados %>%
  group_by(state_province, order_animals) %>%
  summarise(n_interacciones = n(), .groups = "drop")

#Especies de plantas e insectos con mas interacciones

Top_plantas <- datos_filtrados %>%
  filter(!is.na(scientific_name_plants)) %>%
  group_by(scientific_name_plants) %>%
  summarise(n_interacciones = n()) %>%
  arrange(desc(n_interacciones))

Top_insectos <- datos_filtrados %>%
  filter(!is.na(scientific_name_animals)) %>%
  group_by(scientific_name_animals) %>%
  summarise(n_interacciones = n()) %>%
  arrange(desc(n_interacciones))

