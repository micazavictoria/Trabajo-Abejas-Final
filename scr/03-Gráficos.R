
# Abundancia de Interacciones ---------------------------------------------

ggplot(abundancia_interacciones, aes(x = order_animals, y = n_interacciones, fill = order_animals)) +
  geom_col() +
  geom_text(aes(label = n_interacciones), vjust = -0.5, size = 3) +
  scale_fill_manual(values = c("Apodiformes" = "#D5C5D9",
                               "Coleoptera" = "#F2E5D5",
                               "Diptera" = "#E9F2A2",
                               "Hymenoptera" = "#E4F279",
                               "Lepidoptera" = "#F2C572",
                               "Passeriformes" = "#DCBF79")) +
  labs(
    title = "Abundancia de interacciones por orden",
    x = "Orden",
    y = "Número de interacciones"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, size = 13, face = "bold")
  )

# Riqueza de especies -----------------------------------------------------

ggplot(riqueza, aes(x = order_animals, y = n_especies, fill = order_animals)) +
  geom_col() +
  geom_text(aes(label = n_especies), vjust = -0.5, size = 3) +
  scale_fill_manual(values = c("Apodiformes" = "#D5C5D9",
                               "Coleoptera" = "#F2E5D5",
                               "Diptera" = "#E9F2A2",
                               "Hymenoptera" = "#E4F279",
                               "Lepidoptera" = "#F2C572",
                               "Passeriformes" = "#DCBF79")) +
  labs(
    title = "Riqueza de especies por orden",
    x = "Orden",
    y = "Riqueza"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, size = 13, face = "bold")
  )


# Heatmap -----------------------------------------------------------------

ggplot(abundancia_regiones, aes(x = order_animals, y = state_province, fill = n_interacciones)) +
  geom_tile(color = "white", size = 0.5) +
  scale_fill_gradient(low = "#D5C5D9", high = "purple") +
  labs(
    title = "Abundancia de órdenes por región en Chile",
    x = "Orden",
    y = "Región",
    fill = "N° interacciones"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 13, face = "bold"),
    axis.text.x = element_text(angle = 90, hjust = 1)
  )