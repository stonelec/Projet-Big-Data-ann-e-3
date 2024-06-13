# | -------------------------------------- |
# |------| Corélations avec pearson |------|
# | -------------------------------------- | 

cor_age_diam <- cor(data$age_estim, data$tronc_diam, method = "pearson")
graphe_cor_age_diam <- ggplot(data, aes(x = age_estim, y = tronc_diam)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Ligne de régression linéaire
  ggtitle("Corrélation entre l'âge estimé et le diamètre du tronc", round(cor_age_diam,2)) +
  xlab("Âge estimé") +
  ylab("Diamètre du tronc")


cor_age_haut <- cor(data$age_estim, data$haut_tot, method = "pearson")
graphe_cor_age_haut <- ggplot(data, aes(x = age_estim, y = haut_tot)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue", se = FALSE) + # Ligne de régression linéaire
  ggtitle("Corrélation entre l'âge estimé et la hauteur totale", round(cor_age_haut,2)) +
  xlab("Âge estimé") +
  ylab("Hauteur totale")

cor_age_haut_tronc <- cor(data$age_estim, data$haut_tronc, method = "pearson")
graphe_cor_age_haut_tronc <- ggplot(data, aes(x = age_estim, y = haut_tronc)) +
  geom_point() +
  geom_smooth(method = "lm", color = "green", se = FALSE) + # Ligne de régression linéaire
  ggtitle("Corrélation entre l'âge estimé et la hauteur du tronc", round(cor_age_haut_tronc,2)) +
  xlab("Âge estimé") +
  ylab("Hauteur du tronc")

cor_haut_tronc_tot <- cor(data$haut_tronc, data$haut_tot, method = "pearson")
graphe_cor_haut_tronc_tot <- ggplot(data, aes(x = haut_tronc, y = haut_tot)) +
  geom_point() +
  geom_smooth(method = "lm", color = "purple", se = FALSE) + # Ligne de régression linéaire
  ggtitle("Corrélation entre la hauteur totale et la hauteur du tronc", round(cor_haut_tronc_tot,2)) +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

cor_haut_diam <- cor(data$haut_tronc, data$tronc_diam, method = "pearson")
graphe_cor_haut_diam <- ggplot(data, aes(x = haut_tronc, y = tronc_diam)) +
  geom_point() +
  geom_smooth(method = "lm", color = "orange", se = FALSE) + # Ligne de régression linéaire
  ggtitle("Corrélation entre la hauteur du tronc et le diamètre du tronc", round(cor_haut_diam,2)) +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")


graphe_cor_age_diam
graphe_cor_age_haut
graphe_cor_age_haut_tronc
graphe_cor_haut_tronc_tot
graphe_cor_haut_diam







# Calculer la matrice de corrélation
cor_matrix <- cor(data_ia, method = "pearson")

# Afficher la matrice de corrélation
print(cor_matrix)

# Transformer la matrice de corrélation en un format long pour ggplot
melted_cor_matrix <- melt(cor_matrix)

# Créer un heatmap avec ggplot2
ggplot(data = melted_cor_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab", 
                       name="Correlation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1)) +
  coord_fixed() +
  labs(title = "Heatmap de la Matrice de Corrélation",
       x = "Variables",
       y = "Variables") +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank())






# | ------------------------------------- |
# |------| Tableaux de contingence |------|
# | ------------------------------------- | 

# ------------- Remarquable // Stade de développement -------------

# Créer le tableau de contingence
cont_dev_remar <- table(data$fk_stadedev,data$remarquable)
# Tracer le graphique mozaïque
mosaicplot(cont_dev_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Stade de Développement", color = TRUE, las=1)

cont_dev_remar

# ------------- Remarquable // Quartier -------------

# Créer le tableau de contingence
cont_quartier_remar <- table(data$clc_quartier,data$remarquable)
# Tracer le graphique mozaïque
mosaicplot(cont_quartier_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Quartier", las = 2, color = TRUE)

cont_quartier_remar

# ------------- Remarquable // Feuillage -------------

# Créer le tableau de contingence
cont_feuill_remar <- table(data$feuillage,data$remarquable)
# Tracer le graphique mozaïque
mosaicplot(cont_feuill_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Feuillage", color = TRUE, las=1)

cont_feuill_remar

# ------------- Remarquable // Situation -------------

# Créer le tableau de contingence
cont_situation_remar <- table(data$fk_situation,data$remarquable)
# Tracer le graphique mozaïque
mosaicplot(cont_situation_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Situation", color = TRUE, las=1)

cont_situation_remar

# ------------- Remarquable // Revetement -------------

# Créer le tableau de contingence
cont_revet_remar <- table(data$fk_revetement,data$remarquable)
# Tracer le graphique mozaïque
mosaicplot(cont_revet_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Revêtement", color = TRUE, xlab = "Revêtement", ylab = "Remarquable")

cont_revet_remar

# ------------- Remarquable // Age -------------

# Créer le tableau de contingence
cont_age_remar <- table(data$age_estim,data$remarquable)
# Tracer le graphique mozaïque
mosaicplot(cont_age_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Age estimé", color = TRUE, xlab = "Revêtement", ylab = "Remarquable")

cont_age_remar


# ------------- Feuillage // Stade de développement -------------

# Créer le tableau de contingence
cont_dev_feuill <- table(data$fk_stadedev,data$feuillage)
# Tracer le graphique mozaïque
mosaicplot(cont_dev_feuill, main = "Graphique Mozaïque : Type de feuillage vs. Stade de Développement", color = TRUE)

cont_dev_feuill

# ------------- Feuillage // Quartier -------------

# Créer le tableau de contingence
cont_quartier_feuill <- table(data$clc_quartier,data$feuillage)
# Tracer le graphique mozaïque
mosaicplot(cont_quartier_feuill, main = "Graphique Mozaïque : Type de feuillage vs. Quartier", las = 2, color = TRUE)

cont_quartier_feuill

# ------------- Feuillage // Situation -------------

# Créer le tableau de contingence
cont_situation_feuill <- table(data$fk_situation,data$feuillage)
# Tracer le graphique mozaïque
mosaicplot(cont_situation_feuill, main = "Graphique Mozaïque : Type de feuillage vs. Situation", color = TRUE)

cont_situation_feuill

# ------------- Feuillage // Revêtement -------------

# Créer le tableau de contingence
cont_revet_feuill <- table(data$feuillage,data$fk_revetement)
# Tracer le graphique mozaïque
mosaicplot(cont_revet_feuill, main = "Graphique Mozaïque : Type de feuillage vs. Revêtement", color = TRUE)

cont_revet_feuill

# ------------- Feuillage // Revêtement -------------

# Créer le tableau de contingence
cont_age_feuill <- table(data$age_estim,data$feuillage)
# Tracer le graphique mozaïque
mosaicplot(cont_age_feuill, main = "Graphique Mozaïque : Type de feuillage vs. Age estimé", color = TRUE)

cont_age_feuill


# ------------- Quartier // Stade de développement -------------

# Créer le tableau de contingence
cont_quartier_dev <- table(data$clc_quartier,data$fk_stadedev)
# Tracer le graphique mozaïque
mosaicplot(cont_quartier_dev, main = "Graphique Mozaïque : Stade de développement vs. Quartier", las = 2, color = TRUE)

cont_quartier_dev

# ------------------ Quartier // Situation ------------------

# Créer le tableau de contingence
cont_quartier_situation <- table(data$clc_quartier, data$fk_situation)
# Tracer le graphique mozaïque 
mosaicplot(cont_quartier_situation, main = "Graphique Mozaïque : Quartier vs. Situation", las = 2, color = TRUE)

cont_quartier_situation

# ------------- Quartier // Revêtement -------------

# Créer le tableau de contingence
cont_quartier_revet <- table(data$clc_quartier,data$fk_revetement)
# Tracer le graphique mozaïque
mosaicplot(cont_quartier_revet, main = "Graphique Mozaïque : Revêtement vs. Quartier", las = 2, color = TRUE)

cont_quartier_revet

# ------------------ Situation // Revêtement ------------------

# Créer le tableau de contingence
cont_situation_revet <- table(data$fk_situation, data$fk_revetement)
# Tracer le graphique mozaïque 
mosaicplot(cont_situation_revet, main = "Graphique Mozaïque : Revêtement vs. Situation", color = TRUE)

cont_situation_revet

# ------------------ Situation // Stade de développement ------------------

# Créer le tableau de contingence
cont_situation_dev <- table(data$fk_situation, data$fk_stadedev)
# Tracer le graphique mozaïque 
mosaicplot(cont_situation_dev, main = "Graphique Mozaïque : Stade de développement vs. Situation", color = TRUE)

cont_situation_dev

# ------------------ Age // Stade de développement ------------------

# Créer le tableau de contingence
cont_age_dev <- table(data$age_estim, data$fk_stadedev)
# Tracer le graphique mozaïque 
mosaicplot(cont_age_dev, main = "Graphique Mozaïque : Stade de développement vs. Age", color = TRUE, las=1)

cont_age_dev



# | --------------------------------------------------- |
# |------| Ecarts de moyennes entre deux groupes |------|
# | --------------------------------------------------- | 

# Liste des variables à comparer
variables <- c("age_estim", "haut_tot", "tronc_diam")

# ------------------ Type de feuillage ------------------

# Comparaison des moyennes pour chaque variable
for (variable in variables) {
  cat("\nComparaison des moyennes pour:", variable, "\n")
  
  # Extraire les données pour chaque groupe
  conifere_values <- data_conifere[[variable]]
  feuillu_values <- data_feuillu[[variable]]
  
  # Effectuer le test t de Student
  t_test_result_feuill <- t.test(conifere_values, feuillu_values)
  
  # Afficher les résultats
  cat("Moyenne (Conifère):", mean(conifere_values), "\n")
  cat("Moyenne (Feuillu):", mean(feuillu_values), "\n")
  cat("t-value:", t_test_result_feuill$statistic, "\n")
  cat("p-value:", t_test_result_feuill$p.value, "\n")
  cat("Intervalle de confiance:", t_test_result_feuill$conf.int, "\n")
}

# ------------------ Remarquable ------------------

# Comparaison des moyennes pour chaque variable
for (variable in variables) {
  cat("\nComparaison des moyennes pour:", variable, "\n")
  
  # Extraire les données pour chaque groupe
  remar_non_values <- data_remarquable_non[[variable]]
  remar_oui_values <- data_remarquable_oui[[variable]]
  
  # Effectuer le test t de Student
  t_test_result_remar <- t.test(remar_non_values, remar_oui_values)
  
  # Afficher les résultats
  cat("Moyenne (Remarquable=non):", mean(remar_non_values), "\n")
  cat("Moyenne (Remarquable=oui):", mean(remar_oui_values), "\n")
  cat("t-value:", t_test_result_remar$statistic, "\n")
  cat("p-value:", t_test_result_remar$p.value, "\n")
  cat("Intervalle de confiance:", t_test_result_remar$conf.int, "\n")
}


# ------------------ Revêtement ------------------

# Comparaison des moyennes pour chaque variable
for (variable in variables) {
  cat("\nComparaison des moyennes pour:", variable, "\n")
  
  # Extraire les données pour chaque groupe
  revet_non_values <- data_revet_non[[variable]]
  revet_oui_values <- data_revet_oui[[variable]]
  
  # Effectuer le test t de Student
  t_test_result_revet <- t.test(revet_non_values, revet_oui_values)
  
  # Afficher les résultats
  cat("Moyenne (Revetement=non):", mean(revet_non_values), "\n")
  cat("Moyenne (Revetement=oui):", mean(revet_oui_values), "\n")
  cat("t-value:", t_test_result_revet$statistic, "\n")
  cat("p-value:", t_test_result_revet$p.value, "\n")
  cat("Intervalle de confiance:", t_test_result_revet$conf.int, "\n")
}





