# Librairies nécessaires au projet
library(ggplot2)
library(dplyr)
library("stringr")
old_data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv")
data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv")
#-----------------------------------------------------------------------------------------------------
#              HARMONISATION
#-----------------------------------------------------------------------------------------------------
#ENLEVER majuscule
data$fk_stadedev <- data$fk_stadedev %>% str_to_lower()
data$fk_port <- data$fk_port %>% str_to_lower()
data$fk_pied <- data$fk_pied  %>% str_to_lower()
data$fk_arb_etat <- data$fk_arb_etat %>% str_to_lower()
unique(data$fk_arb_etat)

#RAJOUTER accent à e
data$fk_port[ data$fk_port == "couronné"] <- "couronne"



#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES COLLONES INUTILES
#-----------------------------------------------------------------------------------------------------
data <- select(data,-c(src_geo, created_date, created_user, id_arbre, commentaire_environnement,clc_nbr_diag, last_edited_user, last_edited_date, CreationDate, Creator, EditDate, Editor, nomlatin, fk_nomtech, fk_prec_estim))

#-----------------------------------------------------------------------------------------------------
#              REMPLACER LES VIDES
#-----------------------------------------------------------------------------------------------------
#REMPLACER espace seul par vide
data[ data == " "] <- ""

#REMPLACER vide par NA
data[data == ""] <- NA

#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES ARBRES INVALIDES
#-----------------------------------------------------------------------------------------------------
# SUPPRIMER les arbres sans états
data <- data %>%   filter(!(is.na(fk_arb_etat)))

# SUPPRIMER les arbres avec un âge de 2010 mais jeunes
data <- data %>%   filter(!(age_estim == 2010 & !is.na(age_estim)))

# SUPPRIMER les arbres sans position
data <- data %>%   filter(!(is.na(X) | is.na(Y) ))

# SUPPRIMER les arbres sans âge
data <- data %>%   filter(!(is.na(age_estim)))

# SUPPRIMER les arbres sans dimensions
data <- data %>%   filter(!(is.na(haut_tot) | is.na(haut_tronc) | is.na(tronc_diam)))

# SUPPRIMER les arbres avec hauteur total < hauteur tronc
data <- data %>%   filter(!(haut_tot < haut_tronc))

# SUPPRIMER les arbres sans nom
data <- data %>%   filter(!(is.na(nomfrancais) ))

# SUPPRIMER les arbres sans ville
#data <- data %>%   filter(!(is.na(villeca)))

# SUPPRIMER les arbres sans clc_quartier
#data <- data %>%   filter(!(is.na(clc_quartier)))

# SUPPRIMER les arbres sans clc_secteur
data <- data %>%   filter(!(is.na(clc_secteur)))

# SUPPRIMER les arbres sans fk_revetement
#data <- data %>%   filter(!(is.na(fk_revetement)))

# SUPPRIMER les arbres sans fk_stadedev
data <- data %>%   filter(!(is.na(fk_stadedev)))

# SUPPRIMER les arbres sans fk_port
data <- data %>%   filter(!(is.na(fk_port)))

# SUPPRIMER les arbres sans fk_pied
data <- data %>%   filter(!(is.na(fk_pied)))

# SUPPRIMER les arbres sans fk_situation
data <- data %>%   filter(!(is.na(fk_situation)))

# SUPPRIMER les arbres sans feuillage
#data <- data %>%   filter(!(is.na(feuillage)))

# SUPPRIMER les arbres sans feuillage
#data <- data %>%   filter(!(is.na(remarquable)))
#-----------------------------------------------------------------------------------------------------
#              CORRIGER
#-----------------------------------------------------------------------------------------------------
# CORRIGER les arbres EN PLACE avec une date d'abattage par ABATTU
data <- data %>%  mutate(fk_arb_etat = if_else(!is.na(dte_abattage) & fk_arb_etat == "en place", "abattu", fk_arb_etat))
#-----------------------------------------------------------------------------------------------------
#              REMPLACER LES VALEURS INCONUS
#-----------------------------------------------------------------------------------------------------
#REMPLACER villeca
data <- data %>%  mutate(villeca = if_else(is.na(villeca), "cdq", villeca))

#REMPLACER clc_quartier
data <- data %>%  mutate(clc_quartier = if_else(is.na(clc_quartier), "périphérie", clc_quartier))

#REMPLACER fk_revetement
data <- data %>%  mutate(fk_revetement = if_else(is.na(fk_revetement), "inconnu", fk_revetement))

#REMPLACER fk_stadedev
#data <- data %>%  mutate(fk_stadedev = if_else(is.na(fk_stadedev), "inconnu", fk_stadedev))

#REMPLACER fk_port
#data <- data %>%  mutate(fk_port = if_else(is.na(fk_port), "inconnu", fk_port))

#REMPLACER fk_pied
#data <- data %>%  mutate(fk_pied = if_else(is.na(fk_pied), "inconnu", fk_pied))

#REMPLACER fk_situation
#data <- data %>%  mutate(fk_situation = if_else(is.na(fk_situation), "inconnu", fk_situation))

#REMPLACER dte_plantation
data <- data %>%  mutate(dte_plantation = if_else(is.na(dte_plantation), "0", dte_plantation))

#REMPLACER dte_abattage
data <- data %>%  mutate(dte_abattage = if_else(is.na(dte_abattage), "0", dte_abattage))

#REMPLACER feuillage
data <- data %>%  mutate(feuillage = if_else(is.na(feuillage), "inconnu", feuillage))

#REMPLACER remarquable
data <- data %>%  mutate(remarquable = if_else(is.na(remarquable), "inconnu", remarquable))

#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES COLLONES EN TROP
#-----------------------------------------------------------------------------------------------------
#data <- select(data,-c(dte_plantation, dte_abattage))


#-----------------------------------------------------------------------------------------------------
#              AFFICHAGE VALEURS VIDES
#-----------------------------------------------------------------------------------------------------
compter_na_et_vide <- function(data) {
  result <- sapply(data, function(col) {
    n_na <- sum(is.na(col))
    n_vide <- sum(col == "")
    n_espace <- sum(trimws(col) == " ")
    return(c(NA_count = n_na, Empty_count = n_vide, Space_count = n_espace))
  })
  return(as.data.frame(t(result)))
}
resultat <- compter_na_et_vide(data)
print(resultat)
ncol(data)
nrow(data)
