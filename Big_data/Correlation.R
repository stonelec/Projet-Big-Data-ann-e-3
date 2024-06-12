# | ========================================================== |
# |===================| Import des données |===================|
# | ========================================================== |

# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)


# | --------------------------------------------------- |
# |------| Corélations avec le type de feuillage |------|
# | --------------------------------------------------- | 

correlation_age_diam <- cor(data$age_estim, data$tronc_diam, method = "pearson")
ggplot(data, aes(x = age_estim, y = tronc_diam)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Ligne de régression linéaire
  ggtitle("Corrélation entre l'âge estimé et le diamètre du tronc") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")


nuage_feuillage_1 

nuage_feuillage_2

nuage_feuillage_3

nuage_feuillage_4







