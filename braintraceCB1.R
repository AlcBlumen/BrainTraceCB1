# Dados de distribuição regional
dados_regiao <- data.frame(
  Regiao = c("Estriado", "Hipocampo", "Córtex", "Cerebelo", "Tálamo", "Tronco Cerebral"),
  Camundongos = c(6.6, 5.4, 5.1, 4.8, 2.1, 1.8),
  Babuinos = c(5.8, 5.0, 4.7, 4.5, 2.0, 1.5)
)

# Dados de tempo-atividade
dados_tempo_atividade <- data.frame(
  Tempo = c(0, 5, 10, 15, 20, 30, 60, 90),
  Estriado = c(0.2, 2.5, 5.5, 6.6, 6.4, 5.8, 3.2, 1.0),
  Hipocampo = c(0.2, 2.0, 5.0, 5.4, 5.2, 4.6, 2.8, 0.9),
  Talamo = c(0.1, 0.8, 1.8, 2.1, 2.0, 1.5, 0.8, 0.3)
)


install.packages("reshape2")
install.packages("ggplot2")


library(reshape2)
library(ggplot2)

# Dados de distribuição regional para formato longo
dados_longos <- melt(dados_regiao, id.vars = "Regiao", variable.name = "Especie", value.name = "Percentual")

# Mapa de calor
ggplot(dados_longos, aes(x = Especie, y = Regiao, fill = Percentual)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(
    title = "Distribuição Regional dos Receptores CB1 (%ID/g)",
    x = "Espécies",
    y = "Regiões Cerebrais",
    fill = "%ID/g"
  ) +
  theme_minimal()

# Dados de tempo-atividade para formato longo
dados_tempo_longos <- melt(dados_tempo_atividade, id.vars = "Tempo", variable.name = "Regiao", value.name = "Percentual")


ggplot(dados_tempo_longos, aes(x = Tempo, y = Percentual, color = Regiao)) +
  geom_line(size = 1) +
  labs(
    title = "Curvas de Tempo-Atividade nas Regiões Cerebrais",
    x = "Tempo (min)",
    y = "%ID/g",
    color = "Região"
  ) +
  theme_minimal() +
  theme(legend.position = "top")


