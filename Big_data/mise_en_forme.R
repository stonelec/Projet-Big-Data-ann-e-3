install.packages("stringr", repos='http://cran.us.r-project.org')
library("stringr")
data <- read.csv(file = "Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)
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
#pour tours
data[ data == " "] <- ""
unique(data)

#alcul age avec date plantation
calculate_age <- function(date_creation) {
       current_date <- Sys.Date()
       date_creation <- as.POSIXct(date_creation, format = "%Y/%m/%d %H:%M:%S") 
       age_in_days <- difftime(current_date, date_creation, units = "days")  
       age <- as.numeric(age_in_days) / 365.25
       return(age)
}
for (i in 1:nrow(data)) {
  if (is.na(data$age_estim[i])) { 
    if (is.na(data$dte_plantation[i])) { 
      age <- calculate_age(data$dte_plantation[i]) 
      data$age_estim[i] <- round(age, 0)
    }else if (data$fk_stadedev[i] != ""){
      if(data$fk_stadedev[i] == "jeune"){
        data$age_estim[i] <- 15
      }else if (data$fk_stadedev[i] == "adulte"){
        data$age_estim[i] <- 30
      }else if(data$fk_stadedev[i] == "senescent"){
        data$age_estim[i] <- 45
      }else if(data$fk_stadedev[i] == "vieux"){
        data$age_estim[i] <- 60
      }
      
    }
  }
}
#calcul stade avec age
for (i in 1:nrow(data)) {
  if (is.na(data$age_estim[i])) { 
    if (data$fk_stadedev[i] == ""){
      if(data$fk_stadedev[i] <= 15){
        data$fk_stadedev[i] <- "jeune"
      }else if (data$fk_stadedev[i] <= 30){
        data$fk_stadedev[i] <- "adulte"
      }else if(data$fk_stadedev[i] <= 45){
        data$fk_stadedev[i] <- "senescent"
      }else {
        data$fk_stadedev[i] <- "vieux"
      }
      
    }
  }
}
#supprimer collone
library(dplyr)
data <- select(data,-c(created_date, created_user, id_arbre, commentaire_environnement, last_edited_user, last_edited_date, CreationDate, Creator, EditDate, Editor, remarquable, nomlatin, nomfrancais))

#supprime ligne
#-----------------------------------------------------------------------------------------------------
#              PROBLEM SUPPRIME PAS TOUTES LES LIGNES
#-----------------------------------------------------------------------------------------------------
for (i in seq(nrow(data), 1, -1)) {#en sens inverse
  if (is.na(data$fk_arb_etat[i]) || data$fk_arb_etat[i] == "" || data$fk_arb_etat[i] == " ") { 
    data <- data[-i,]
  } else if (!is.na(data$age_estim[i]) && data$age_estim[i] == 2010) {
    data <- data[-i,]
  }else if(data$fk_arb_etat[i] != "ABATTU" || data$fk_arb_etat[i] != "SUPPRIMÉ" || data$fk_arb_etat[i] != "REMPLACÉ" || data$fk_arb_etat[i] == "Essouché"){
    if (any(is.na(data[i, ])) || any(data[i, ] == "") || any(data[i, ] == " ")) { 
      data <- data[-i,]
    }
  }
}

