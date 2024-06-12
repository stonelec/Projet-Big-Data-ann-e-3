# Importer la librairie nécessaire
library(ggplot2)
library("stringr")
data <- `Patrimoine_Arboré_(RO)`
#View(data)

#-----------------------------------------------------------------------------------------------------
#              MISE EN FORME DES DONNEES
#-----------------------------------------------------------------------------------------------------
#Enlevé majuscule & vérifier
data$fk_stadedev <- data$fk_stadedev %>% str_to_lower()
unique(data$fk_stadedev)
data$fk_port <- data$fk_port %>% str_to_lower()
unique(data$fk_port)
data$fk_pied <- data$fk_pied  %>% str_to_lower()
unique(data$fk_pied)

#Rajouté accent a e
data$fk_port[ data$fk_port == "couronne"] <- "couronné"
unique(data$fk_port)

#Remplacer espace seul par vide
data$fk_stadedev[ data$fk_stadedev == " "] <- ""
unique(data$fk_stadedev)
data$fk_port[ data$fk_port == " "] <- ""
unique(data$fk_port)
data$fk_pied[ data$fk_pied == " "] <- ""
unique(data$fk_pied)
#pour touss
data[ data == " "] <- ""
unique(data)

#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES COLLONES D'ADMINISTRATION
#-----------------------------------------------------------------------------------------------------
library(dplyr)
data <- select(data,-c(src_geo, created_date, created_user, id_arbre, commentaire_environnement,clc_nbr_diag, last_edited_user, last_edited_date, CreationDate, Creator, EditDate, Editor, nomlatin, fk_nomtech, fk_prec_estim))


#-----------------------------------------------------------------------------------------------------
#              REMPLACER LES VIDE PAS NA
#-----------------------------------------------------------------------------------------------------
data[data == ""] <- NA
#-----------------------------------------------------------------------------------------------------
#              CORRIGER LES ARBES INCOHERENTS
#-----------------------------------------------------------------------------------------------------
library(dplyr)

#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER
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
data <- data %>%   filter(!(haut_tot <haut_tronc))

# SUPPRIMER les arbres sans nom
data <- data %>%   filter(!(is.na(nomfrancais) ))

# SUPPRIMER les arbres sans ville
data <- data %>%   filter(!(is.na(villeca)))

#-----------------------------------------------------------------------------------------------------
#              CORRIGER
#-----------------------------------------------------------------------------------------------------
# CORRIGER les arbres EN PLACE avec une date d'abattage par ABATTU
#data <- data %>%   mutate(fk_stadedev= if_else(fk_arb_etat == "EN PLACE" & dte_abattage != "", "ABATTU", "mort"))

data <- data %>%  mutate(fk_stadedev = if_else((fk_arb_etat == "ABATTU" | fk_arb_etat == "EN PLACE" | fk_arb_etat == "SUPPRIMÉ") & is.na(dte_abattage), "mort", fk_stadedev))
#-----------------------------------------------------------------------------------------------------
#              REMPLACER LES VELEURS INCONUS
#-----------------------------------------------------------------------------------------------------
#REMPLACER clc_quartier
data <- data %>%  mutate(clc_quartier = if_else(is.na(clc_quartier), "inconu", clc_quartier))

#REMPLACER fk_revetement
data <- data %>%  mutate(fk_revetement = if_else(is.na(fk_revetement), "inconu", fk_revetement))

#REMPLACER fk_stadedev
data <- data %>%  mutate(fk_stadedev = if_else(is.na(fk_stadedev), "inconu", fk_stadedev))

#REMPLACER fk_port
data <- data %>%  mutate(fk_port = if_else(is.na(fk_port), "inconu", fk_port))

#REMPLACER fk_pied
data <- data %>%  mutate(fk_pied = if_else(is.na(fk_pied), "inconu", fk_pied))

#REMPLACER fk_situation
data <- data %>%  mutate(fk_situation = if_else(is.na(fk_situation), "inconu", fk_situation))

#REMPLACER dte_plantation
data <- data %>%  mutate(dte_plantation = if_else(is.na(dte_plantation), "0", dte_plantation))

#REMPLACER dte_abattage
data <- data %>%  mutate(dte_abattage = if_else(is.na(dte_abattage), "0", dte_abattage))

#REMPLACER feuillage
data <- data %>%  mutate(feuillage = if_else(is.na(feuillage), "inconu", feuillage))

#REMPLACER remarquable
data <- data %>%  mutate(remarquable = if_else(is.na(remarquable), "inconu", remarquable))

#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES COLLONES EN TROP
#-----------------------------------------------------------------------------------------------------
#data <- select(data,-c(dte_plantation, dte_abattage))

compter_na_et_vide <- function(data) {
  result <- sapply(data, function(col) {
    n_na <- sum(is.na(col))
    n_vide <- sum(col == "", na.rm = TRUE)
    n_espace <- sum(trimws(col) == " ", na.rm = TRUE)
    return(c(NA_count = n_na, Empty_count = n_vide, Space_count = n_espace))
  })
  return(as.data.frame(t(result)))
}
resultat <- compter_na_et_vide(data)
print(resultat)
nrow(data)

View(data)

#-----------------------------------------------------------------------------------------------------
#              LES QUARTIERS
#-----------------------------------------------------------------------------------------------------

columns <- c("clc_quartier","fk_arb_etat","fk_stadedev","fk_port","fk_pied",
             "fk_situation","fk_revetement", "feuillage","remarquable")


#Le simulate.p.value est utilisé souvent lorsqu'on a des données manquantes
#ou quand nous avons pas beaucoup de données et permet d'avoir une plus grande précisions. 
#Dans notre cas, nous avons rajouter des données mais elles sont considérées comme manquantes.
#C'est pour cela que nous allons faire avec les 2 méthodes

for (i in 1:(length(columns)-1)) {

    for (j in (i+1):length(columns)) {
      
      print("")
      print("--------------------------------------------------------------")
      print("")
      
      # ----- Création du tableau croisé : -----
      tableau_croise <- table(data[[columns[i]]], data[[columns[j]]])
      print(paste("Tableau croisé entre", columns[i], "et", columns[j]))
      #print(tableau_croise)
      
      # ----- Test du chi2 : -----  
      
      #METHODE SANS SIMULATE.P.VALUE :
      avec_simulate__chisq <- chisq.test(tableau_croise, simulate.p.value = TRUE)
      
      #METHODE AVEC SIMULATE.P.VALUE :
      sans_simulate__chisq <- chisq.test(tableau_croise)
      
      #Affichage de d'autres données
      #print(test_chisq$statistic)
      #print("")
      #print(test_chisq$observed)
      #print(test_chisq$expected)
      
      if (avec_simulate__chisq$p.value >= 0.05){
        
        print(paste("Pour la méthode sans simulate, les valeurs sont indépendantes car ", avec_simulate__chisq$p.value ," est supérieur à 0.05"))
        
      }
      else{
        
        print(paste("Pour la méthode sans simulate, les valeurs sont dépendantes car ", avec_simulate__chisq$p.value ," est inférieure à 0.05"))
        
      }
      if (sans_simulate__chisq$p.value >= 0.05){
        
        print(paste("Pour la méthode sans simulate, les valeurs sont indépendantes car ", sans_simulate__chisq$p.value ," est supérieur à 0.05"))
        
      }
      else{
        
        print(paste("Pour la méthode sans simulate, les valeurs sont dépendantes car ", sans_simulate__chisq$p.value ," est inférieure à 0.05"))
        
      }
      
    }
  
}
