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


cor_matrix <- cor(data, method = "pearson")
print(cor_matrix)


# | --------------------------------------------------- |
# |------| Ecarts de moyennes entre deux groupes |------|
# | --------------------------------------------------- | 

# Créer le tableau de contingence
cont_dev_remar <- table(data$fk_stadedev,data$remarquable)
# Tracer le graphique mozaïque
moz_cont_dev_remar <- mosaicplot(cont_dev_remar, main = "Graphique Mozaïque : Caractère Remarquable vs. Stade de Développement")



moz_cont_dev_remar

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





