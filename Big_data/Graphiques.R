# | ========================================================== |
# |===================| Import des données |===================|
# | ========================================================== |



data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)



# | ======================================================== |
# |======| Corélations avec le stade de développement |======|
# | ======================================================== | 

# ---------- Entre l'âge de l'arbre et la date de plantation ----------
ggplot(data, aes(x=dte_plantation, y=age_estim, color = fk_stadedev))+
  geom_point() +
  ggtitle("Age estimé en fonction de la date de plantation") +
  xlab("Date de plantation") +
  ylab("Age estim") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# ---------- Entre le stade de développement et la date de plantation ----------
ggplot(data, aes(x=fk_stadedev, y=age_estim, color = fk_stadedev))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_stadedev)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
ggplot(data, aes(x=haut_tronc, y=haut_tot, color = fk_stadedev)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

# ---------- Entre la hauteur totale et l'âge estimé ----------
ggplot(data, aes(x=age_estim, y=haut_tot, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")




