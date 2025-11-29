

# Librerias Mapas ---------------------------------------------------------
library(rnaturalearth)
library(rnaturalearthdata)
library(sf)


# Datos Mapas -------------------------------------------------------------

chile <- ne_states(country = "chile", returnclass = "sf")

mapa_abundancia <- chile %>%
  left_join(abundancia_regiones_total, by = c("name" = "state_province"))

# Plots Mapas -------------------------------------------------------------

#Abundancia total de interacciones
ABUN_TOTAL <- ggplot(mapa_abundancia) +
  geom_sf(aes(fill = n_interacciones), color = "white", size = 0.3) +
  scale_fill_gradient(low = "#D5C5D9", high = "purple", na.value = "gray90")
print(ABUN_TOTAL)

#Hacemos un patchwork con el heatmap
ABUN_TOTAL + HEATMAP + plot_layout(widths = c(2, 0.5))