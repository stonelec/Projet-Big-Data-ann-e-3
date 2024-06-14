library(ggplot2)
# | ===================================================== |
# |======| PPREDICTION ARBRE POUR POLITIQUE URBAINE|======|
# | ===================================================== |
#nombre d'arbes en fonction du quartier
ggplot(tab, aes_string(x = "clc_quartier", y = "Freq")) +
  geom_bar(stat = "identity", fill="darkred") +
  theme_gray() +
  labs(title = "Nombre d'arbres par quartier",
       x = "Quartier",
       y = "Nombre d'arbres") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#nombre d'arbes en fonction de plusieurs caractéritiques 
columns <- c("fk_stadedev", "fk_port", "fk_pied", "fk_situation", "feuillage")

for (i in 1:length(columns)) {
  
  # Create a contingency table
  tableau <- table(data$clc_quartier, data[[columns[i]]])
  
  # Convert the table to a data frame
  tab <- as.data.frame(tableau)
  
  # Rename the columns
  colnames(tab) <- c("clc_quartier", columns[i], "Freq")
  
  
  # Create the ggplot graph
  graph <- ggplot(tab, aes_string(x = "clc_quartier", y = "Freq", fill = columns[i])) +
    geom_bar(stat = "identity", position = "fill") +
    theme_gray() +
    labs(title = paste("Relation entre clc_quartier et", columns[i]),
         x = "clc_quartier",
         y = "Fréquence") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  # Display the graph
  print(graph)
}

# | =================================== |
# |======| PPREDICTION AGE ARBRE |======|
# | =================================== |
index <- sample(1:nrow(data), size = round(0.7 * nrow(data)), replace = FALSE)

# Créer les ensembles train et test
train_data <- data[index, ]
test_data <- data[-index, ]

#CREER un modèle de l'âge à partir des dimensions physique des arbres
model_age <- lm(age_estim ~ haut_tronc + tronc_diam, data = train_data)
# PRERDIR sur les données de test
test_data$age_pred <- predict(model_age, newdata = test_data)
summary(model_age)
# CALCULER les écarts sur test
test_data$age_resid <- abs(test_data$age_estim - test_data$age_pred)

# Graphique des écarts positifs vs valeurs réelles avec ligne moyenne
ggplot(test_data, aes(x = age_estim, y = age_resid)) +
  geom_point(alpha = 0.3) +
  theme_gray() +
  labs(title = "Écarts Absolus par rappport âge réel en années", x = "Âge ", y = "Écarts Absolus ") + 
  geom_hline(yintercept = mean(test_data$age_resid), color = "red", linetype = "dashed") +
  annotate("text",
           x = max(test_data$age_estim) - 20,
           y = mean(test_data$age_resid) + 1.5,
           label = paste("Moyenne des écarts =",
           round(mean(test_data$age_resid), 2)), color = "red")
