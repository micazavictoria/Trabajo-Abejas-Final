
# Riqueza por ordenes -----------------------------------------------------

Riqueza <- ggplot(data = diversidad_orden,
                  aes(x = reorder(order_animals, n_especies),  
                      y = n_especies,
                      fill = order_animals)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = n_especies), hjust = -0.3, size = 4) +  
  scale_fill_manual(values = c("Coleoptera" = "brown",
                               "Diptera" = "cyan4",
                               "Hymenoptera" = "darkorange",
                               "Lepidoptera" = "purple")) +
  labs(x = "Orden",
       y = "Riqueza de especies") +
  theme_minimal(base_size = 12)

print(Riqueza)