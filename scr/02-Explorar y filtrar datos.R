
# Exploración inicial ---------------------------------------------------------------
datos %>% 
  count(stateProvince, sort = TRUE) 

# Filtrar Regiones  ---------------------------------------------------------------
datos_filtrados <- datos %>% 
  filter(stateProvince %in% c("Los Lagos", "Los Rios")) #Filtramos

datos_filtrados %>% 
  count(stateProvince, sort = TRUE) %>% #Verificamos
  print()

