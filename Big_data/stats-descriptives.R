# | ========================================================== |
# |===================| Import des données |===================|
# | ========================================================== |



data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)



# | =========================================================================== |
# |======| On cherche des corélations entre différentes caractéristiques |======|
# | =========================================================================== |



# A-- Voir la répartition en fonction du stade dans chaque villeca
# Création d'un nouveau dataframe contenant le compte des occurrences pour chaque combinaison de valeurs
counts_stade_ville <- data %>%
  group_by(fk_stadedev, villeca) %>%
  summarize(counts_stade_ville = n())

# Création du graphique
ggplot(counts_stade_ville, aes(x = fk_stadedev, y = villeca)) +
  geom_tile(aes(fill = counts_stade_ville)) +
  geom_text(aes(label = counts_stade_ville), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de l'intersection de fk_stadedev et villeca") +
  xlab("fk_stadedev") +
  ylab("villeca")



# B-- Voir la répartition en fonction du stade dans chaque quartier
# Création d'un nouveau dataframe contenant le compte des occurrences pour chaque combinaison de valeurs
counts_stade_quartier <- data %>%
  group_by(fk_stadedev, clc_quartier) %>%
  summarize(counts_stade_quartier = n())

# Création du graphique
ggplot(counts_stade_quartier, aes(x = fk_stadedev, y = clc_quartier)) +
  geom_tile(aes(fill = counts_stade_quartier)) +
  geom_text(aes(label = counts_stade_quartier), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de l'intersection de fk_stadedev et clc_quartier") +
  xlab("fk_stadedev") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# C-- Voir la répartition en fonction du stade pour chaque situation
# Création d'un nouveau dataframe contenant le compte des occurrences pour chaque combinaison de valeurs
counts_stade_situation <- data %>%
  group_by(fk_stadedev, fk_situation) %>%
  summarize(counts_stade_situation = n())

# Création du graphique
ggplot(counts_stade_situation, aes(x = fk_stadedev, y = fk_situation)) +
  geom_tile(aes(fill = counts_stade_situation)) +
  geom_text(aes(label = counts_stade_situation), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de l'intersection de fk_stadedev et fk_situation") +
  xlab("fk_stadedev") +
  ylab("fk_situation") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

