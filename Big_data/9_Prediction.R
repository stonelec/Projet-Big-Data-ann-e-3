# | =================================== |
# |======| PPREDICTION AGE ARBRE |======|
# | =================================== |

#CREER un modèle de l'âge à partir des dimensions physique des arbres
model_age <- lm(age_estim ~ haut_tronc + tronc_diam, data = data)
# PRERDIR sur les données de test
data$age_pred <- predict(model_age, newdata = data)
summary(model_age)
# CALCULER les écarts sur test
data$age_resid <- abs(data$age_estim - data$age_pred)

# Graphique des écarts positifs vs valeurs réelles avec ligne moyenne
ggplot(data, aes(x = age_estim, y = age_resid)) +
  geom_point(alpha = 0.3) +
  geom_hline(yintercept = mean(data$age_resid), color = "red", linetype = "dashed") +
  labs(title = "Écarts Absolus vs Âge (année)", x = "Âge (années)", y = "Écarts Absolus") + 
  theme_minimal() + 
  annotate("text", x = max(data$age_estim) - 20, y = mean(data$age_resid) + 1.5,label = paste("Moyenne des écarts =", round(mean(data$age_resid), 2)), color = "red")
