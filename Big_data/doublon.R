#importer csv
data <- read.csv(file = "Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

#tableau occurenc GlobalID
n_occur <- data.frame(table(data$GlobalID))
n_occur[n_occur$Freq > 1,]
#0
n_occur <- data.frame(table(data$OBJECTID))
n_occur[n_occur$Freq > 1,]
#0
n_occur <- data.frame(table(data$id_arbre))
n_occur[n_occur$Freq > 1,]
#beacoup d'occurence

#occurence porsition
library(dplyr)
data_vivant <- data 
filter(fk_arb_etat== "Oui")
doublons <- data_vivant 
group_by(X, Y)
filter(n() > 1)
ungroup()

#pas d'arbre qui se superpose