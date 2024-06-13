# | ======================================== |
# |======| PPREDICTION PROCHAIN ARBRE |======|
# | ======================================== |


# | =================================== |
# |======| PPREDICTION AGE ARBRE |======|
# | =================================== |


data_ia$fk_arb_etat <- as.numeric(as.factor(data$fk_arb_etat)) # ça sert a rien gros fdp
data_ia$fk_stadedev <- as.numeric(as.factor(data$fk_stadedev)) # ça sert a rien gros fdp
data_ia$fk_situation <- as.numeric(as.factor(data$fk_situation)) # ça sert a rien gros fdp
data_ia$remarquable <- as.numeric(as.factor(data$remarquable)) # ça sert a rien gros fdp
test_data <- data # pourquoi pas la version full num ? gros fdp
#model_age <- lm(age_estim ~ fk_arb_etat + haut_tronc + tronc_diam + fk_stadedev + fk_situation + remarquable, data = train_data)
model_age <- lm(age_estim ~ haut_tronc + tronc_diam, data = train_data)
# PRERDIR sur les données de test
test_data$age_pred <- predict(model_age, newdata = test_data)
summary(model_age)
# CALCULER les écarts sur test
test_data$age_resid <- abs(test_data$age_estim - test_data$age_pred)

# Graphique des écarts positifs vs valeurs réelles avec ligne moyenne
ggplot(test_data, aes(x = age_estim, y = age_resid)) +
  geom_point(alpha = 0.3) +
  geom_hline(yintercept = mean(test_data$age_resid), color = "red", linetype = "dashed") +
  labs(title = "Écarts Absolus vs Âge (année)", x = "Âge (années)", y = "Écarts Absolus") + 
  theme_minimal() + 
  annotate("text", x = max(test_data$age_estim) - 20, y = mean(test_data$age_resid) + 1.5,label = paste("Moyenne des écarts =", round(mean(test_data$age_resid), 2)), color = "red")
