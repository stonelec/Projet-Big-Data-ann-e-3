#install.packages("leaflet")
#install.packages("sf")
#install.packages("RColorBrewer")

# Charger les bibliothèques nécessaires
library(leaflet)
library(readr)
library(dplyr)
library(sf)
library(RColorBrewer)


# | ========================================================== |
# |===================| Import des données |===================|
# | ========================================================== |

# Déterminer les limites des axes 
xlim <- range(c(data$X))
ylim <- range(c(data$Y))

# | ======================================================================= |
# |======| Observer la répartition en fonction de certains attributs |======|
# | ======================================================================= |

# <<-------------------// Quartier \\------------------->>

map_quartier <- ggplot(data, aes(x = X, y = Y, color = clc_quartier)) +
  geom_point() +
  ggtitle("Répartition des données par quartier") +
  xlab("X") +
  ylab("Y") +
  xlim(xlim) + ylim(ylim)

map_quartier

# Créer un objet sf avec les coordonnées Lambert CC Zone 49 = Saint Quentin
coordinates_sf <- st_as_sf(data, coords = c("X", "Y"), crs = 3949)

# Transformer les coordonnées en WGS84
coordinates_wgs84 <- st_transform(coordinates_sf, crs = 4326)

# Extraire les nouvelles colonnes de longitude et latitude
data$lon <- st_coordinates(coordinates_wgs84)[,1]
data$lat <- st_coordinates(coordinates_wgs84)[,2]

# Remplacer les valeurs NA de clc_quartier par une valeur temporaire pour gestion
data <- data %>% mutate(clc_quartier = ifelse(is.na(clc_quartier), "Unknown", clc_quartier))

# Générer une palette de couleurs basée sur les quartiers
unique_quartiers <- unique(data$clc_quartier)
num_colors <- length(unique_quartiers)
palette <- brewer.pal(min(num_colors, 12), "Paired")  # Utiliser la palette Paired pour des couleurs vives

# Si plus de 12 quartiers, répéter les couleurs
if (num_colors > 12) {
  palette <- rep(palette, length.out = num_colors)
}

# Ajouter la couleur noire pour les "Unknown"
palette <- c(palette, "black")
unique_quartiers <- c(unique_quartiers, "Unknown")

# Créer une fonction de couleur pour les quartiers
pal <- colorFactor(palette, domain = unique_quartiers)

# Créer une carte leaflet avec une légende
map_quartier_colo <- leaflet(data) %>%
  addTiles() %>%
  addCircleMarkers(~lon, ~lat, radius = 1, 
                   color = ~ifelse(clc_quartier == "Unknown", "black", pal(clc_quartier)),
                   fill = TRUE, fillOpacity = 0.7) %>%
  addLegend("bottomright", colors = palette, labels = unique_quartiers,
            title = "Quartiers",
            opacity = 1)

# Afficher la carte
map_quartier_colo


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


