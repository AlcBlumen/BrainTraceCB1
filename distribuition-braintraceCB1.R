
library(ggplot2)

# Dados de distribuição regional
dados_regiao <- data.frame(
  Regiao = c("Estriado", "Hipocampo", "Córtex", "Cerebelo", "Tálamo", "Tronco Cerebral"),
  Camundongos = c(6.6, 5.4, 5.1, 4.8, 2.1, 1.8),
  Babuinos = c(5.8, 5.0, 4.7, 4.5, 2.0, 1.5)
)

# Converter os dados para formato longo
library(reshape2) # Para conversão
dados_longos <- melt(dados_regiao, id.vars = "Regiao", variable.name = "Especie", value.name = "Percentual")

# Criar o mapa de calor
ggplot(dados_longos, aes(x = Especie, y = Regiao, fill = Percentual)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(
    title = "Distribuição Regional dos Receptores CB1 (%ID/g)",
    x = "Espécies",
    y = "Regiões Cerebrais",
    fill = "%ID/g"
  ) +
  theme_minimal()
