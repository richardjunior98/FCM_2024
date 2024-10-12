# Carregar pacotes necessários
library(tidyverse)
library(rcartocolor)

# Definir cores
cores <- rcartocolor::carto_pal(12, "Bold")

# Ler o arquivo CSV
dados <- read.csv("C:/Users/richa/Desktop/Doutorado/Disciplinas/2º semestre/Ferramentas Computacionais/praticaR/atividade/br_sp_gov_ssp_ocorrencias_registradas.csv")

# Filtrar os dados para a região de Bauru e os primeiros 3 meses
df <- filter(dados, ano >= 2017, mes <= 3, regiao_ssp == 'Bauru')

# Resumir os dados para calcular o total de furtos por ano e mês
furtos <- df %>%
  group_by(ano, mes) %>%
  summarise(total_furtos = sum(furto_outros, na.rm = TRUE), .groups = 'drop')

# Criar gráfico
ggplot(furtos, aes(x = factor(ano), y = total_furtos, fill = factor(mes))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = cores[c(1, 2, 3)], 
                    labels = c("Janeiro", "Fevereiro", "Março")) +
  labs(x = "Ano", y = "Número de furtos", fill = "Mês") +
  ggtitle("Número de furtos na região de Bauru nos meses do primeiro trimestre") +
  theme_minimal(base_size = 12) +
  theme(
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "white"),
    axis.ticks.x = element_blank(),
    legend.position = "bottom",
    legend.title = element_blank(),
    axis.title.x = element_text(face = "bold", size = 18),
    axis.title.y = element_text(face = "bold", size = 18),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    plot.title = element_text(face = "bold", size = 20, hjust = 0.5)
  )