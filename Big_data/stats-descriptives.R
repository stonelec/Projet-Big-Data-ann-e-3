# | ========================================================== |
# |===================| Import des données |===================|
# | ========================================================== |



data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

# Charger les bibliothèques nécessaires
library(ggplot2)
library(dplyr)


# | ============================================================================== |
# |======| On cherche des corélations par rapport au stade de développement |======|
# | ============================================================================== | 





# 04. Hauteur du tronc et diamètre du tronc
ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_stadedev)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Age de l'arbre et hauteur totale


# 06. Age de l'arbre et hauteur tronc
ggplot(data, aes(x=age_estim, y=haut_tronc, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

# 07. Age de l'arbre et diamètre tronc
ggplot(data, aes(x=age_estim, y=tronc_diam, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

# 08. Stade de developpement et hauteur totale
ggplot(data, aes(x=fk_stadedev, y=haut_tot, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du stade de développement") +
  xlab("Stade de developpement") +
  ylab("Hauteur totale")

# 09. Stade de developpement et hauteur tronc
ggplot(data, aes(x=fk_stadedev, y=haut_tronc, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du stade de développement") +
  xlab("Stade de developpement") +
  ylab("Hauteur totale")

# 10. Stade de developpement et diamètre tronc
ggplot(data, aes(x=fk_stadedev, y=tronc_diam, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du stade de développement") +
  xlab("Stade de developpement") +
  ylab("Hauteur totale")



# | ============================================================================== |
# |=======| On cherche des corrélations par rapport à la forme de l'arbre |========|
# | ============================================================================== |



# 01. Répartition des données par forme de l'arbre


# 02. Âge de l'arbre et date de plantation en fonction de la forme de l'arbre
ggplot(data, aes(x = dte_plantation, y = age_estim, color = fk_port)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par forme de l'arbre") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Forme de l'arbre et âge estimé
ggplot(data, aes(x = fk_port, y = age_estim, color = fk_port)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la forme de l'arbre") +
  xlab("Forme de l'arbre") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 04. Hauteur du tronc et diamètre du tronc en fonction de la forme de l'arbre
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par forme de l'arbre") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale en fonction de la forme de l'arbre
ggplot(data, aes(x = age_estim, y = haut_tot, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par forme de l'arbre") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc en fonction de la forme de l'arbre
ggplot(data, aes(x = age_estim, y = haut_tronc, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par forme de l'arbre") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc en fonction de la forme de l'arbre
ggplot(data, aes(x = age_estim, y = tronc_diam, color = fk_port)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par forme de l'arbre") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Forme de l'arbre et hauteur totale
ggplot(data, aes(x = fk_port, y = haut_tot, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de la forme de l'arbre") +
  xlab("Forme de l'arbre") +
  ylab("Hauteur totale") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 09. Forme de l'arbre et hauteur du tronc
ggplot(data, aes(x = fk_port, y = haut_tronc, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la forme de l'arbre") +
  xlab("Forme de l'arbre") +
  ylab("Hauteur du tronc") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 10. Forme de l'arbre et diamètre du tronc
ggplot(data, aes(x = fk_port, y = tronc_diam, color = fk_port)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la forme de l'arbre") +
  xlab("Forme de l'arbre") +
  ylab("Diamètre du tronc") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X



# | ================================================================== |
# |======| On cherche des corélations en fonction des quartiers |======|
# | ================================================================== |

# 01. Répartition des données par quartier


# 02. Quartier et date de plantation
ggplot(data, aes(x = dte_plantation, y = age_estim, color = clc_quartier)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par quartier") +
  xlab("Date de plantation") +
  ylab("Âge estimé") 

# 03. Quartier et âge estimé
ggplot(data, aes(x = clc_quartier, y = age_estim, color = clc_quartier)) +
  geom_point() +
  ggtitle("Âge estimé en fonction du quartier") +
  xlab("Quartier") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 04. Hauteur du tronc et diamètre du tronc par quartier
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par quartier") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc") 

# 05. Âge de l'arbre et hauteur totale par quartier
ggplot(data, aes(x = age_estim, y = haut_tot, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par quartier") +
  xlab("Âge estimé") +
  ylab("Hauteur totale") 

# 06. Âge de l'arbre et hauteur du tronc par quartier
ggplot(data, aes(x = age_estim, y = haut_tronc, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par quartier") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc") 

# 07. Âge de l'arbre et diamètre du tronc par quartier
ggplot(data, aes(x = age_estim, y = tronc_diam, color = clc_quartier)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par quartier") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc") 

# 08. Quartier et hauteur totale
ggplot(data, aes(x = clc_quartier, y = haut_tot, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction du quartier") +
  xlab("Quartier") +
  ylab("Hauteur totale") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 09. Quartier et hauteur du tronc
ggplot(data, aes(x = clc_quartier, y = haut_tronc, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du quartier") +
  xlab("Quartier") +
  ylab("Hauteur du tronc") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 10. Quartier et diamètre du tronc
ggplot(data, aes(x = clc_quartier, y = tronc_diam, color = clc_quartier)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du quartier") +
  xlab("Quartier") +
  ylab("Diamètre du tronc") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X


# | ========================================================================= |
# |======| On cherche des corélations en fonction du type de feuillage |======|
# | ========================================================================= |



# 01. Répartition des données par type de feuillage


# 02. Date de plantation et âge estimé par type de feuillage
ggplot(data, aes(x = dte_plantation, y = age_estim, color = feuillage)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par type de feuillage") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Type de feuillage et âge estimé
ggplot(data, aes(x = feuillage, y = age_estim, color = feuillage)) +
  geom_point() +
  ggtitle("Âge estimé en fonction du type de feuillage") +
  xlab("Type de feuillage") +
  ylab("Âge estimé")

# 04. Hauteur du tronc et diamètre du tronc par type de feuillage
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par type de feuillage") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale par type de feuillage
ggplot(data, aes(x = age_estim, y = haut_tot, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par type de feuillage") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc par type de feuillage
ggplot(data, aes(x = age_estim, y = haut_tronc, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par type de feuillage") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc par type de feuillage
ggplot(data, aes(x = age_estim, y = tronc_diam, color = feuillage)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par type de feuillage") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Type de feuillage et hauteur totale
ggplot(data, aes(x = feuillage, y = haut_tot, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction du type de feuillage") +
  xlab("Type de feuillage") +
  ylab("Hauteur totale")

# 09. Type de feuillage et hauteur du tronc
ggplot(data, aes(x = feuillage, y = haut_tronc, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du type de feuillage") +
  xlab("Type de feuillage") +
  ylab("Hauteur du tronc")

# 10. Type de feuillage et diamètre du tronc
ggplot(data, aes(x = feuillage, y = tronc_diam, color = feuillage)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du type de feuillage") +
  xlab("Type de feuillage") +
  ylab("Diamètre du tronc")



# | =============================================================== |
# |======| On cherche des corélations en fonction de villeca |======|
# | =============================================================== |



# 01. Répartition des données par ville


# 02. Date de plantation et âge estimé par ville
ggplot(data, aes(x = dte_plantation, y = age_estim, color = villeca)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par ville") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Ville et âge estimé
ggplot(data, aes(x = villeca, y = age_estim, color = villeca)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la ville") +
  xlab("Ville") +
  ylab("Âge estimé")

# 04. Hauteur du tronc et diamètre du tronc par ville
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par ville") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale par ville
ggplot(data, aes(x = age_estim, y = haut_tot, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par ville") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc par ville
ggplot(data, aes(x = age_estim, y = haut_tronc, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par ville") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc par ville
ggplot(data, aes(x = age_estim, y = tronc_diam, color = villeca)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par ville") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Ville et hauteur totale
ggplot(data, aes(x = villeca, y = haut_tot, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de la ville") +
  xlab("Ville") +
  ylab("Hauteur totale")

# 09. Ville et hauteur du tronc
ggplot(data, aes(x = villeca, y = haut_tronc, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la ville") +
  xlab("Ville") +
  ylab("Hauteur du tronc")

# 10. Ville et diamètre du tronc
ggplot(data, aes(x = villeca, y = tronc_diam, color = villeca)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la ville") +
  xlab("Ville") +
  ylab("Diamètre du tronc")



# | =================================================================== |
# |======| On cherche des corélations en fonction du type de sol |======|
# | =================================================================== |



# 01. Répartition des données par type de sol


# 02. Date de plantation et âge estimé par type de sol
ggplot(data, aes(x = dte_plantation, y = age_estim, color = fk_pied)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par type de sol") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Type de sol et âge estimé
ggplot(data, aes(x = fk_pied, y = age_estim, color = fk_pied)) +
  geom_point() +
  ggtitle("Âge estimé en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 04. Hauteur du tronc et diamètre du tronc par type de sol
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par type de sol") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale par type de sol
ggplot(data, aes(x = age_estim, y = haut_tot, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par type de sol") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc par type de sol
ggplot(data, aes(x = age_estim, y = haut_tronc, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par type de sol") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc par type de sol
ggplot(data, aes(x = age_estim, y = tronc_diam, color = fk_pied)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par type de sol") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Type de sol et hauteur totale
ggplot(data, aes(x = fk_pied, y = haut_tot, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Hauteur totale") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 09. Type de sol et hauteur du tronc
ggplot(data, aes(x = fk_pied, y = haut_tronc, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Hauteur du tronc") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 10. Type de sol et diamètre du tronc
ggplot(data, aes(x = fk_pied, y = tronc_diam, color = fk_pied)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Diamètre du tronc") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X



# | ================================================================== |
# |======| On cherche des corélations en fonction du revêtement |======|
# | ================================================================== |



# 01. Répartition des données par revêtement


# 02. Date de plantation et âge estimé par revêtement
ggplot(data, aes(x = dte_plantation, y = age_estim, color = fk_revetement)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par revêtement") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Revêtement et âge estimé
ggplot(data, aes(x = fk_revetement, y = age_estim, color = fk_revetement)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Âge estimé")

# 04. Hauteur du tronc et diamètre du tronc par revêtement
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par revêtement") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale par revêtement
ggplot(data, aes(x = age_estim, y = haut_tot, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par revêtement") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc par revêtement
ggplot(data, aes(x = age_estim, y = haut_tronc, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par revêtement") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc par revêtement
ggplot(data, aes(x = age_estim, y = tronc_diam, color = fk_revetement)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par revêtement") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Revêtement et hauteur totale
ggplot(data, aes(x = fk_revetement, y = haut_tot, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Hauteur totale")

# 09. Revêtement et hauteur du tronc
ggplot(data, aes(x = fk_revetement, y = haut_tronc, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Hauteur du tronc")

# 10. Revêtement et diamètre du tronc
ggplot(data, aes(x = fk_revetement, y = tronc_diam, color = fk_revetement)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Diamètre du tronc")



# | ============================================================================= |
# |======| On cherche des corélations en fonction du caractère remarquable |======|
# | ============================================================================= |



n_occur <- data.frame(table(data$remarquable))
n_occur[n_occur$Freq > 1,]                       #  110 -> oui /// 11 290 -> non

# 01. Répartition des données par caractère remarquable
ggplot(data, aes(x = X, y = Y, color = remarquable)) +
  geom_point() +
  ggtitle("Répartition des données par caractère remarquable") +
  xlab("X") +
  ylab("Y")

# 02. Date de plantation et âge estimé par caractère remarquable
ggplot(data, aes(x = dte_plantation, y = age_estim, color = remarquable)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par caractère remarquable") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Caractère remarquable et âge estimé
ggplot(data, aes(x = remarquable, y = age_estim, color = remarquable)) +
  geom_point() +
  ggtitle("Âge estimé en fonction du caractère remarquable") +
  xlab("Caractère remarquable") +
  ylab("Âge estimé")

# 04. Hauteur du tronc et diamètre du tronc par caractère remarquable
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par caractère remarquable") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale par caractère remarquable
ggplot(data, aes(x = age_estim, y = haut_tot, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par caractère remarquable") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc par caractère remarquable
ggplot(data, aes(x = age_estim, y = haut_tronc, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par caractère remarquable") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc par caractère remarquable
ggplot(data, aes(x = age_estim, y = tronc_diam, color = remarquable)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par caractère remarquable") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Caractère remarquable et hauteur totale
ggplot(data, aes(x = remarquable, y = haut_tot, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction du caractère remarquable") +
  xlab("Caractère remarquable") +
  ylab("Hauteur totale")

# 09. Caractère remarquable et hauteur du tronc
ggplot(data, aes(x = remarquable, y = haut_tronc, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du caractère remarquable") +
  xlab("Caractère remarquable") +
  ylab("Hauteur du tronc")

# 10. Caractère remarquable et diamètre du tronc
ggplot(data, aes(x = remarquable, y = tronc_diam, color = remarquable)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du caractère remarquable") +
  xlab("Caractère remarquable") +
  ylab("Diamètre du tronc")



# | ==================================================================== |
# |======| On cherche des corélations en fonction de la situation |======|
# | ==================================================================== |



# 01. Répartition des données par situation
ggplot(data, aes(x = X, y = Y, color = fk_situation)) +
  geom_point() +
  ggtitle("Répartition des données par situation") +
  xlab("X") +
  ylab("Y")

# 02. Date de plantation et âge estimé par situation
ggplot(data, aes(x = dte_plantation, y = age_estim, color = fk_situation)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la date de plantation par situation") +
  xlab("Date de plantation") +
  ylab("Âge estimé") +
  theme(axis.text.x = element_blank()) # enlève les valeurs sur l'axe des X

# 03. Situation et âge estimé
ggplot(data, aes(x = fk_situation, y = age_estim, color = fk_situation)) +
  geom_point() +
  ggtitle("Âge estimé en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Âge estimé")

# 04. Hauteur du tronc et diamètre du tronc par situation
ggplot(data, aes(x = haut_tronc, y = tronc_diam, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du diamètre du tronc par situation") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

# 05. Âge de l'arbre et hauteur totale par situation
ggplot(data, aes(x = age_estim, y = haut_tot, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé par situation") +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

# 06. Âge de l'arbre et hauteur du tronc par situation
ggplot(data, aes(x = age_estim, y = haut_tronc, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de l'âge estimé par situation") +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

# 07. Âge de l'arbre et diamètre du tronc par situation
ggplot(data, aes(x = age_estim, y = tronc_diam, color = fk_situation)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé par situation") +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")

# 08. Situation et hauteur totale
ggplot(data, aes(x = fk_situation, y = haut_tot, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur totale en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Hauteur totale")

# 09. Situation et hauteur du tronc
ggplot(data, aes(x = fk_situation, y = haut_tronc, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Hauteur du tronc")

# 10. Situation et diamètre du tronc
ggplot(data, aes(x = fk_situation, y = tronc_diam, color = fk_situation)) +
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la présence de revêtement") +
  xlab("Présence de revêtement") +
  ylab("Diamètre du tronc")



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

