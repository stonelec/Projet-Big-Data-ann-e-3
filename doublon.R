#importer csv
data <- read.csv2(file = "Patrimoine_Arboré_(RO).csv", header = TRUE, sep = ',', stringsAsFactors = TRUE)

#tableau occurenc GlobalID
n_occur <- data.frame(table(data$GlobalID))
n_occur[n_occur$Freq > 1,]
#0
n_occur <- data.frame(table(data$OBJECTID))
n_occur[n_occur$Freq > 1,]
#0
n_occur <- data.frame(table(data$id_arbre))
n_occur[n_occur$Freq > 1,]

#occurence porsition
n_occur <- data.frame(table(data$X), table(data$X))
n_occur[n_occur$Freq > 1,]