
# Filtrar datos -----------------------------------------------------------
#Filtrar Regiones y Ordenes de polinizadores
datos_filtrados <- datos %>% 
  filter(state_province %in% c("Los Lagos", "Los Rios"))

datos_filtrados <- datos_filtrados %>% 
  filter(order_animals %in% c("Hymenoptera", "Coleoptera", "Diptera", "Lepidoptera"))

#Verificar filtros
datos_filtrados%>% 
  count(state_province, sort = TRUE) 

datos_filtrados %>% 
  count(order_animals, sort = TRUE)


# Explorar datos ----------------------------------------------------------
#Resumen general de mis datos
resumen_general <- datos_filtrados %>% 
  summarise(
    n_interacciones = n(),
    n_plantas = n_distinct(scientific_name_plants),
    n_polinizadores = n_distinct(scientific_name_animals),
    n_familias_plantas = n_distinct(family_plants),
    n_familias_animales = n_distinct(family_animals)
  )

#Diversidad por orden
diversidad_orden <- datos_filtrados %>% 
  group_by(order_animals) %>% 
  summarise(
    n_especies = n_distinct(scientific_name_animals),
    n_interacciones = n(),
    .groups = "drop"
  ) %>% 
  arrange(desc(n_especies))

#TOP especies por orden
top_especies <- datos_filtrados %>% 
  group_by(order_animals, scientific_name_animals) %>% 
  summarise(n_interacciones = n(), .groups = "drop") %>% 
  group_by(order_animals) %>% 
  slice_max(n_interacciones, n = 3) %>% 
  arrange(order_animals, desc(n_interacciones))

#Plantas más visitadas
plantas_top <- datos_filtrados %>% 
  count(scientific_name_plants, family_plants, sort = TRUE) %>% 
  head(15)

#Origen de plantas
origen_plantas <- datos_filtrados %>% 
  count(establishment_means_plants, sort = TRUE)