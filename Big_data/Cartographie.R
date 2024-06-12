# | ========================================================== |
# |===================| Import des données |===================|
# | ========================================================== |



#data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)

# Déterminer les limites des axes 
xlim <- range(c(data$X))
ylim <- range(c(data$Y))



# | ========================================================== |
# |======| Voir si des arbes sont trop loin de la ville |======|
# | ========================================================== |



numeric_data <- data[!is.na(as.numeric(data$X)) & !is.na(as.numeric(data$Y)), ]

if (nrow(numeric_data) > 0) {
  moy_X <- mean(as.numeric(numeric_data$X))
  moy_Y <- mean(as.numeric(numeric_data$Y))
}

# Fonction pour créer les coordonnées d'un cercle
create_circle <- function(center_x, center_y, radius, n_points = 100) {
  t <- seq(0, 2*pi, length.out = n_points)
  x <- center_x + radius * cos(t)
  y <- center_y + radius * sin(t)
  return(data.frame(x = x, y = y))
}

# Créer les coordonnées du cercle
circle_data <- create_circle(moy_X, moy_Y, 4500)

# Créer le graphique avec toutes les données et le cercle
map_ville <- ggplot(data, aes(x = X, y = Y)) +
  geom_point() +  # Afficher les points des données
  geom_path(data = circle_data, aes(x = x, y = y), color = "red") +  # Tracer le cercle
  ggtitle("Répartition des données avec cercle") +
  xlab("X") +
  ylab("Y") 

map_ville

# | ======================================================================= |
# |======| Observer la répartition en fonction de certains attributs |======|
# | ======================================================================= |


# <<-------------------// Stade de développement \\------------------->>

# Séparation des données en deux sous-ensembles : revêtement oui et revêtement non
data_stade_jeune <- subset(data, fk_stadedev == "jeune")
data_stade_adulte <- subset(data, fk_stadedev == "adulte")
data_stade_vieux <- subset(data, fk_stadedev == "vieux")
data_stade_senescent <- subset(data, fk_stadedev == "senescent")

map_stade <- ggplot(data, aes(x = X, y = Y, color = fk_stadedev)) +
  geom_point() +
  ggtitle("Répartition des données par classification d'âge") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_stade_jeune <- ggplot(data_stade_jeune, aes(x = X, y = Y)) +
  geom_point(color = "red") +
  ggtitle("Répartition des données pour stade=jeune") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_stade_adulte <- ggplot(data_stade_adulte, aes(x = X, y = Y)) +
  geom_point(color = "blue") +
  ggtitle("Répartition des données pour stade=adulte") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_stade_vieux <- ggplot(data_stade_vieux, aes(x = X, y = Y)) +
  geom_point(color = "green") +
  ggtitle("Répartition des données pour stade=vieux") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_stade_senescent <- ggplot(data_stade_senescent, aes(x = X, y = Y)) +
  geom_point(color = "brown") +
  ggtitle("Répartition des données pour stade=senescent") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Affichage des graphiques
map_stade
map_stade_jeune
map_stade_adulte
map_stade_vieux
map_stade_senescent

# <<-------------------// Forme de l'arbre \\------------------->>

map_port <- ggplot(data, aes(x = X, y = Y, color = fk_port)) +
  geom_point() +
  ggtitle("Répartition des données par forme de l'arbre") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_port

# <<-------------------// Quartier \\------------------->>

map_quartier <- ggplot(data, aes(x = X, y = Y, color = clc_quartier)) +
  geom_point() +
  ggtitle("Répartition des données par quartier") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_quartier

# <<-------------------// Feuillage \\------------------->>

map_feuillage <- ggplot(data, aes(x = X, y = Y, color = feuillage)) +
  geom_point() +
  ggtitle("Répartition des données par type de feuillage") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Séparation des données en deux sous-ensembles : Conifère et feuillu
data_conifere <- subset(data, feuillage == "Conifère")
data_feuillu <- subset(data, feuillage == "Feuillu")

map_conifere <- ggplot(data_conifere, aes(x = X, y = Y)) +
  geom_point(color = "blue") +
  ggtitle("Répartition des données pour les arbres conifères") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_feuillu <- ggplot(data_feuillu, aes(x = X, y = Y)) +
  geom_point(color = "red") +
  ggtitle("Répartition des données pour les arbres feuillus") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_feuillage
map_conifere
map_feuillu

# Affichage de la carte pour chaque feuillage; par quartier
map_conifere_quartier <- ggplot(data_conifere, aes(x = X, y = Y, color=clc_quartier)) +
  geom_point() +
  ggtitle("Répartition des données pour les arbres conifères par quartiers") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_feuillu_quartier <- ggplot(data_feuillu, aes(x = X, y = Y, color=clc_quartier)) +
  geom_point() +
  ggtitle("Répartition des données pour les arbres feuillus par quartiers") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_conifere_quartier
map_feuillu_quartier

# <<-------------------// Ville \\------------------->>

map_villeca <- ggplot(data, aes(x = X, y = Y, color = villeca)) +
  geom_point() +
  ggtitle("Répartition des données par ville") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_villeca

# <<-------------------// Type de sol \\------------------->>

map_pied <- ggplot(data, aes(x = X, y = Y, color = fk_pied)) +
  geom_point() +
  ggtitle("Répartition des données par type de sol") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_pied

# <<-------------------// Revêtement \\------------------->>

# Séparation des données en deux sous-ensembles : revêtement oui et revêtement non
data_revet_oui <- subset(data, fk_revetement == "Oui")
data_revet_non <- subset(data, fk_revetement == "Non")

# Création des graphiques
map_revet <- ggplot(data, aes(x = X, y = Y, color = fk_revetement)) +
  geom_point() +
  ggtitle("Répartition des données par revêtement") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Affichage de la carte pour revêtement = non
map_revet_oui <- ggplot(data_revet_oui, aes(x = X, y = Y)) +
  geom_point(color = "blue") +
  ggtitle("Répartition des données pour revêtement = oui") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Affichage de la carte pour revêtement = non
map_revet_non <- ggplot(data_revet_non, aes(x = X, y = Y)) +
  geom_point(color = "red") +
  ggtitle("Répartition des données pour revêtement = non") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Affichage des graphiques
map_revet
map_revet_oui
map_revet_non

# <<-------------------// Remarquable \\------------------->>

map_remar <- ggplot(data, aes(x = X, y = Y, color = remarquable)) +
  geom_point() +
  ggtitle("Répartition des données par caractère remarquable") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Séparation des données en deux sous-ensembles : remarquable oui et remarquable non
data_remarquable_oui <- subset(data, remarquable == "Oui")
data_remarquable_non <- subset(data, remarquable == "Non")

# Affichage de la carte pour remarquable = oui
map_remar_oui <- ggplot(data_remarquable_oui, aes(x = X, y = Y)) +
  geom_point(color = "blue") +
  ggtitle("Répartition des données pour remarquable = oui") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

# Affichage de la carte pour remarquable = non
map_remar_non <- ggplot(data_remarquable_non, aes(x = X, y = Y)) +
  geom_point(color = "red") +
  ggtitle("Répartition des données pour remarquable = non") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_remar
map_remar_oui
map_remar_non

# Affichage de la carte pour remarquable = non; par quartier
map_remar_oui_quartier <- ggplot(data_remarquable_oui, aes(x = X, y = Y, color=clc_quartier)) +
  geom_point() +
  ggtitle("Répartition des données pour remarquable = oui sur chaque quartier") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_remar_oui_quartier


