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
#print(moyenne_age_jeune)
#print(moyenne_age_adulte)
#print(moyenne_age_vieux)
#print(moyenne_age_senescent)

#age <- data[c("fk_stadedev", "age_estim")]
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
  
  else if(data$age_estim[i] == 0){
  
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

#View(data)
 
 
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

#View(data)

# ------------------------------------------------------------------------------------------------------
# ---------------------------------------- Remplir vide par NA  ----------------------------------------
# ------------------------------------------------------------------------------------------------------

var <- 0

for (i in 1:nrow(data)) {
  
  var = var + 1
    
  # --------------------
  # ----- POUR X : -----
  # --------------------
  
  if(is.na(data$X[i])){
    
    print("On a un NA pour X : ")
    print(var)
    next
    
  }
  
  else if(data$X[i] == ""){
    
    data$X[i] <- NA
    
  }
  
  
  # --------------------
  # ----- POUR Y : -----
  # --------------------
  
  if(is.na(data$Y[i])){
    
    print("On a un NA pour Y : ")
    print(var)
    next
    
  }
  
  else if(data$Y[i] == ""){

    data$Y[i] <- NA
    
  }
  
  # ---------------------------
  # ----- POUR OBJECTID : -----
  # ---------------------------
  
  if(is.na(data$OBJECTID[i])){
    
    print("On a un NA pour OBJECTID : ")
    print(var)
    next
    
  }
  
  else if(data$OBJECTID[i] == ""){
  
    data$OBJECTID[i] <- NA
    
  }
  
  # --------------------------
  # ----- POUR src_geo : -----
  # --------------------------
  
  if(is.na(data$src_geo[i])){
    
    print("On a un NA pour src_geo : ")
    print(var)
    next
    
  }
  
  else if(data$src_geo[i] == ""){
    
    data$src_geo[i] <- NA
    
  }
  
  # -------------------------------
  # ----- POUR clc_quartier : -----
  # -------------------------------
  
  if(is.na(data$clc_quartier[i])){
    
    print("On a un NA pour clc_quartier : ")
    print(var)
    next
    
  }
  
  else if(data$clc_quartier[i] == ""){
    
    data$clc_quartier[i] <- NA
    
  }
  
  # -------------------------------
  # ----- POUR clc_secteur : -----
  # -------------------------------
  
  if(is.na(data$clc_quartier[i])){
  if(is.na(data$clc_secteur[i])){
    
    print("On a un NA pour clc_quartier : ")
    print("On a un NA pour clc_secteur : ")
    print(var)
    next
    
  }
  
  else if(data$clc_quartier[i] == ""){
  else if(data$clc_secteur[i] == ""){
    
    data$clc_quartier[i] <- NA
    data$clc_secteur[i] <- NA
    
  }
  
}

#View(data)