library("stringr")
data <- read.csv(file = "./Big_data/Patrimoine_Arboré_(RO).csv")
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
#              MISE A JOUR ET CALCUL AGE
#-----------------------------------------------------------------------------------------------------

moyenne_age_jeune <- mean(data$age_estim[data$fk_stadedev == "jeune"], na.rm = TRUE)
moyenne_age_adulte <- mean(data$age_estim[data$fk_stadedev == "adulte"], na.rm = TRUE)
moyenne_age_vieux <- mean(data$age_estim[data$fk_stadedev == "vieux"], na.rm = TRUE)
moyenne_age_senescent <- mean(data$age_estim[data$fk_stadedev == "senescent"], na.rm = TRUE)

limite_jeune = (moyenne_age_jeune + moyenne_age_adulte) / 2
limite_adulte = (moyenne_age_vieux + moyenne_age_adulte) / 2
limite_vieux = (moyenne_age_senescent + moyenne_age_vieux) / 2

#calcul age en fonction de la date de plantation
calculate_age <- function(date_creation) {
       current_date <- Sys.Date()
       date_creation <- as.POSIXct(date_creation, format = "%Y/%m/%d %H:%M:%S") 
       age_in_days <- difftime(current_date, date_creation, units = "days")  
       age <- as.numeric(age_in_days) / 365.25
       return(age)
}

#mise à jour de l'age en fonction de la date de plantation sinon du stade si pas d'age
for (i in 1:nrow(data)) {
  if (is.na(data$age_estim[i])) { 
    if (is.na(data$dte_plantation[i])) { 
      age <- calculate_age(data$dte_plantation[i]) 
      data$age_estim[i] <- round(age, 0)
    }else if (data$fk_stadedev[i] != ""){
      if(data$fk_stadedev[i] == "jeune"){
        data$age_estim[i] <- moyenne_age_jeune
      }else if (data$fk_stadedev[i] == "adulte"){
        data$age_estim[i] <- moyenne_age_adulte
      }else if(data$fk_stadedev[i] == "senescent"){
        data$age_estim[i] <- moyenne_age_vieux
      }else {
        data$age_estim[i] <- moyenne_age_senescent
      }
      
    }
  }
}
#mise à jour du stade en fonction de l'age si pas de stade
for (i in 1:nrow(data)) {
  if (is.na(data$age_estim[i])) { 
    if (data$fk_stadedev[i] == ""){
      if(data$fk_stadedev[i] <= limite_jeune){
        data$fk_stadedev[i] <- "jeune"
      }else if (data$fk_stadedev[i] <= limite_adulte){
        data$fk_stadedev[i] <- "adulte"
      }else if(data$fk_stadedev[i] <= limite_vieux){
        data$fk_stadedev[i] <- "senescent"
      }else {
        data$fk_stadedev[i] <- "vieux"
      }
      
    }
    if(data$fk_arb_etat[i] == "SUPPRIMÉ" || data$fk_arb_etat[i] == "Essouché" || data$fk_arb_etat[i] == "ABATTU"){
      data$fk_stadedev[i] <- "Mort"
      data$age_estim[i] <- NA
    }
  }
}
#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES COLLONES D'ADMINISTRATION
#-----------------------------------------------------------------------------------------------------
library(dplyr)
data <- select(data,-c(src_geo, created_date, created_user, id_arbre, commentaire_environnement,clc_nbr_diag, last_edited_user, last_edited_date, CreationDate, Creator, EditDate, Editor, nomlatin, fk_nomtech, fk_prec_estim))


#-----------------------------------------------------------------------------------------------------
#              CORRIGER LES ARBES INCOHERENTS
#-----------------------------------------------------------------------------------------------------
library(lubridate)
for (i in seq(nrow(data), 1, -1)) {#parcourir en sens inverse
  if (is.na(data$fk_arb_etat[i]) || data$fk_arb_etat[i] == "" || data$fk_arb_etat[i] == " ") {#SUPPRIMER les arbres sans états
    data <- data[-i,]
    next
  }else if (!is.na(data$age_estim[i]) && data$age_estim[i] == 2010) {#SUPPRIMER l'arbre avec un age de 2010 mais jeune
    data <- data[-i,]
    next
  }else if(data$X[i] == "" || data$Y[i] == ""){#SUPPRIMER les arbres sans position
      data <- data[-i,]
      next
  }else if(is.na(data$age_estim[i]) || data$age_estim[i] == ""){#SUPPRIMER les arbres sans age
    data <- data[-i,]
    next
  }else if(is.na(data$haut_tot[i]) || is.na(data$haut_tronc[i]) || is.na(data$tronc_diam[i])){#SUPPRIMER les arbres sans dimensions
    data <- data[-i,]
    next
  }else if(is.na(data$nomfrancais[i]) || data$nomfrancais[i] == ""){#SUPPRIMER les arbres sans nom
    data <- data[-i,]
    next
  }else if(is.na(data$villeca[i]) || data$villeca[i] == ""){#SUPPRIMER les arbres sans ville
    data <- data[-i,]
    next
  }else if(is.na(data$feuillage[i]) || (data$feuillage[i] == "")){#SUPPRIMER les arbres sans feuillage
    data <- data[-i,]
    next
  }else if(data$fk_arb_etat[i] == "EN PLACE" || is.na(data$fk_arb_etat[i])){#CORRIGER les arbres EN PLACE avec une date d'abatage par ABATTU
    if(data$dte_abattage[i] != ""){
      data$fk_arb_etat[i] == "ABATTU"
      next
    }
  }
}

#-----------------------------------------------------------------------------------------------------
#              SUPPRIMER LES COLLONES EN TROP
#-----------------------------------------------------------------------------------------------------
data <- select(data,-c(dte_plantation, dte_abattage))


#-----------------------------------------------------------------------------------------------------
#              REMPLACER LES VIDE PAS NA
#-----------------------------------------------------------------------------------------------------
data[data == ""] <- NA

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