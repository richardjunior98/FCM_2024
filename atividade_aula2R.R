#? Filtrar todos os pokemons com bee ou bel no nome

library("tidyverse")

dados <- read.csv("C:/Users/richa/Desktop/Doutorado/Disciplinas/2º semestre/Ferramentas Computacionais/praticaR/atividade/Pokemon_full.csv")

dados %>%
  group_by(name) %>%
    mutate(
      there_is_bel = any(grepl("[Bb]el",name))
    ) %>% View()

dados %>%
  filter(grepl("[Bb]el", name)) %>%
  View()

dados %>%
  group_by(name) %>%
    mutate(
      there_is_bee = any(grepl("[Bb]ee",name))
    ) %>% View()

dados %>%
  filter(grepl("[Bb]ee", name)) %>%
  View()

dados %>%
  group_by(name) %>%
    mutate(
      there_is_bel_and_bee = any(grepl("[Bb][el|ee]",name))
    ) %>% View()

dados %>%
  filter(grepl("[Bb](el|ee)", name)) %>%
  View()