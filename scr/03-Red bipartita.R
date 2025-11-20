
# Tabla interacciones unicas ----------------------------------------------

interacciones <- datos_filtrados %>% 
  filter(!is.na(scientific_name_plants) & !is.na(scientific_name_animals)) %>% 
  select(planta = scientific_name_plants,
         polinizador = scientific_name_animals,
         orden = order_animals,
         familia_planta = family_plants,
         familia_animal = family_animals) %>% 
  count(planta, polinizador, orden, familia_planta, familia_animal, name = "frecuencia")


# Matriz de interacciones -------------------------------------------------

matriz_red <- interacciones %>% 
  select(planta, polinizador, frecuencia) %>% 
  group_by(planta, polinizador) %>%                   
  summarise(frecuencia = sum(frecuencia), .groups = "drop") %>%  
  pivot_wider(names_from = polinizador, 
              values_from = frecuencia, 
              values_fill = 0) %>% 
  column_to_rownames("planta") %>% 
  as.matrix()

# Métricas ----------------------------------------------------------------

## Métricas por especie
# Grado (número de interacciones por especie)

grado_plantas <- rowSums(matriz_red > 0)
grado_polinizadores <- colSums(matriz_red > 0)

# Top 10 plantas más conectadas
sort(grado_plantas, decreasing = TRUE)[1:10]

# Top 10 polinizadores más conectados
sort(grado_polinizadores, decreasing = TRUE)[1:10]

## Métricas por orden
metricas_orden <- interacciones %>% 
  group_by(orden) %>% 
  summarise(
    n_especies = n_distinct(polinizador),
    n_plantas_visitadas = n_distinct(planta),
    total_interacciones = sum(frecuencia),
    interacciones_promedio = mean(frecuencia),
    .groups = "drop"
  ) %>% 
  arrange(desc(total_interacciones))

## Contribución relativa de cada orden a la conectancia 
contribucion_orden <- metricas_orden %>% 
  mutate(
    prop_especies = n_especies / sum(n_especies) * 100,
    prop_interacciones = total_interacciones / sum(total_interacciones) * 100
  )

