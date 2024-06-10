# Importer csv
data <- read.csv(file = "Big_Data/Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)
#View(data)

#Pour supprimer certaines colonnes :
#data <- subset(data, select = -c(created_date, created_user, last_edited_user, last_edited_date, CreationDate, Creator, EditDate, Editor, remarquable))

moyenne_age_jeune <- mean(data$age_estim[data$fk_stadedev == "jeune"], na.rm = TRUE)
moyenne_age_adulte <- mean(data$age_estim[data$fk_stadedev == "adulte"], na.rm = TRUE)
moyenne_age_vieux <- mean(data$age_estim[data$fk_stadedev == "vieux"], na.rm = TRUE)

limite_jeune = (moyenne_age_jeune + moyenne_age_adulte) / 2
limite_adulte = (moyenne_age_vieux + moyenne_age_adulte) / 2

# Affichage de les moyennes :
#print(moyenne_age_jeune)
#print(moyenne_age_adulte)
#print(moyenne_age_vieux)

#age <- data[c("fk_stadedev", "age_estim")]
#View(age)

for (i in 1:nrow(data)) {

  if(is.na(data$age_estim[i])){
   
    next 
    
  }
  
  if(data$age_estim[i] == 0){
  
    if (data$age_estim[i] <= limite_jeune) {
      data$fk_stadedev[i] <- "jeune"
      
    } else if (data$age_estim[i] > limite_jeune && data$age_estim[i] <= limite_adulte) {
      
      data$fk_stadedev[i] <- "adulte"
      
    } else if (data$age_estim[i] > limite_adulte) {
      
      data$fk_stadedev[i] <- "vieux"
      
    }
      
  }
  
  if(data$fk_stadedev[i] == ""){
    
    if (data$age_estim[i] <= limite_jeune) {
      data$fk_stadedev[i] <- "jeune"
      
    } else if (data$age_estim[i] > limite_jeune && data$age_estim[i] <= limite_adulte) {
      
      data$fk_stadedev[i] <- "adulte"
      
    } else if (data$age_estim[i] > limite_adulte) {
      
      data$fk_stadedev[i] <- "vieux"
      
    }
    
  }
  
}

age <- data[c("fk_stadedev", "age_estim")]
View(age)
