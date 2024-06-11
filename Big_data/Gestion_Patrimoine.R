# Importer csv
data <- read.csv(file = "Big_Data/Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

# --------------------------------------------------------------------------------------------------------
# ---------------------------------------- Supression de colonnes ----------------------------------------
# --------------------------------------------------------------------------------------------------------

data <- subset(data, select = -c(created_date, created_user, last_edited_user, last_edited_date, CreationDate, Creator, EditDate, Editor, remarquable))

# ---------------------------------------------------------------------------------------------
# ---------------------------------------- Gestion Age ----------------------------------------
# ---------------------------------------------------------------------------------------------

moyenne_age_jeune <- mean(data$age_estim[data$fk_stadedev == "jeune"], na.rm = TRUE)
moyenne_age_adulte <- mean(data$age_estim[data$fk_stadedev == "adulte"], na.rm = TRUE)
moyenne_age_vieux <- mean(data$age_estim[data$fk_stadedev == "vieux"], na.rm = TRUE)
moyenne_age_senescent <- mean(data$age_estim[data$fk_stadedev == "senescent"], na.rm = TRUE)

limite_jeune = (moyenne_age_jeune + moyenne_age_adulte) / 2
limite_adulte = (moyenne_age_vieux + moyenne_age_adulte) / 2
limite_vieux = (moyenne_age_senescent + moyenne_age_vieux) / 2

# Affichage de les moyennes :


age <- data[c("fk_stadedev", "age_estim")]
#View(age)

data$fk_stadedev <- as.character(data$fk_stadedev)

for (i in 1:nrow(data)) {
  
  if(is.na(data$age_estim[i])){
    
    next 
    
  }
  
  if(data$fk_arb_etat[i] == "SUPPRIMÉ" || data$fk_arb_etat[i] == "Essouché" || data$fk_arb_etat[i] == "ABATTU"){
    
    data$fk_stadedev[i] <- "Mort"
    data$age_estim[i] <- NA
    data$feuillage[i] <- NA
    
  }
  
  else if(data$fk_stadedev[i] == ""){
    
    if (data$age_estim[i] <= limite_jeune) {
      data$fk_stadedev[i] <- "jeune"
      
    } else if (data$age_estim[i] > limite_jeune && data$age_estim[i] <= limite_adulte) {
      
      data$fk_stadedev[i] <- "adulte"
      
    } else if (data$age_estim[i] > limite_adulte && data$age_estim[i] <= limite_vieux) {
      
      data$fk_stadedev[i] <- "vieux"
      
    } else if (data$age_estim[i] > limite_vieux) {
      
      data$fk_stadedev[i] <- "senescent"
      
    }
    
  }
  
}

#age <- data[c("fk_stadedev", "age_estim")]
#View(age)

#tab <- data[c("fk_stadedev")]
#View(tab)

View(data)


# ------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Remplacer les "oui" et les "non" ----------------------------------------
# ------------------------------------------------------------------------------------------------------------------

data$fk_revetement <- as.character(data$fk_revetement)

for (i in 1:nrow(data)) {
  
  if(data$fk_revetement[i] == ""){
    
    next
    
  }
  
  if(data$fk_revetement[i] == "Oui"){
    
    data$fk_revetement[i] <- 1
    
  } else if (data$fk_revetement[i] == "Non"){
    
    data$fk_revetement[i] <- 0
    
  }
  
}

View(data)

# ------------------------------------------------------------------------------------------------------
# ---------------------------------------- Remplir vide par NA  ----------------------------------------
# ------------------------------------------------------------------------------------------------------

columns <- c("X","Y","OBJECTID","src_geo","clc_quartier","clc_secteur","id_arbre","haut_tot",
             "haut_tronc","tronc_diam","fk_arb_etat","fk_stadedev","fk_port","fk_pied","fk_situation","fk_revetement",
             "commentaire_environnement","dte_plantation","age_estim","fk_prec_estim","clc_nbr_diag","dte_abattage",
             "fk_nomtech","villeca","nomfrancais","nomlatin","GlobalID","feuillage")


for (col_name in columns) {
  
  for (i in 1:nrow(data)) {
    
    if (is.na(data[[col_name]][i])) {
      
      next
      
    } else if (data[[col_name]][i] == "") {
      
      data[[col_name]][i] <- NA
      
    }
  }
}
View(data)