data_1 <- data

data_1$fk_arb_etat <- as.factor(data_1$fk_arb_etat)

# Mettre à 0 si pas d'abbatage prévu, mettre à 1 sinon
data_1$fk_arb_etat <- ifelse(data_1$fk_arb_etat != "en place", 1, 0)

# Vérifier les occurrences
#n_occur <- data.frame(table(data_1$fk_arb_etat))
#n_occur[n_occur$Freq > 1,]

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$age_estim)
summary(model) #0.01 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim, data = data_1, family = binomial)
summary(model)

#Affichage  

#On obtient :
#logit(E(Y)) = 0.019X - 3.19

plot(data_1$age_estim, data_1$fk_arb_etat)
myreg=glm(data_1$fk_arb_etat~data_1$age_estim, family=binomial(link=logit))
ypredit=myreg$fitted
o=order(data_1$age_estim)
points(data_1$age_estim[o],ypredit[o], col="red", type="l", lwd=2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$haut_tot)
summary(model)

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tot, data = data_1, family = binomial)
summary(model) #0.01254 Pas intéressant

#Affichage

plot(data_1$haut_tot, data_1$fk_arb_etat)
myreg=glm(data_1$fk_arb_etat~data_1$haut_tot, family=binomial(link=logit))
ypredit=myreg$fitted
o=order(data_1$haut_tot)
points(data_1$haut_tot[o],ypredit[o], col="red", type="l", lwd=2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tronc : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$haut_tronc)
summary(model)#0.001544 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tronc, data = data_1, family = binomial)
summary(model)

#Affichage

plot(data_1$haut_tronc, data_1$fk_arb_etat)
myreg=glm(data_1$fk_arb_etat~data_1$haut_tronc, family=binomial(link=logit))
ypredit=myreg$fitted
o=order(data_1$haut_tronc)
points(data_1$haut_tronc[o],ypredit[o], col="red", type="l", lwd=2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le tronc_diam : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$tronc_diam)
summary(model) #0.001544 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ tronc_diam, data = data_1, family = binomial)
summary(model)

#Affichage

plot(data_1$tronc_diam, data_1$fk_arb_etat)
myreg=glm(data_1$fk_arb_etat~data_1$tronc_diam, family=binomial(link=logit))
ypredit=myreg$fitted
o=order(data_1$tronc_diam)
points(data_1$tronc_diam[o],ypredit[o], col="red", type="l", lwd=2)






# ---------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim et haut_tot : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$age_estim + data_1$haut_tot)
summary(model) #0.0197 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim+haut_tot, data = data_1, family = binomial)
summary(model)

plot(data_1$age_estim, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tot, data_1$fk_arb_etat, col = "red")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ age_estim + haut_tot, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$age_estim + data_1$haut_tot)
lines((data_1$age_estim + data_1$haut_tot)[o], ypredit[o], col = "green", lwd = 2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim et haut_tronc : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$age_estim + data_1$haut_tronc)
summary(model) #0.01895 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim+haut_tronc, data = data_1, family = binomial)
summary(model)

plot(data_1$age_estim, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tronc, data_1$fk_arb_etat, col = "red")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ age_estim + haut_tronc, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$age_estim + data_1$haut_tronc)
lines((data_1$age_estim + data_1$haut_tronc)[o], ypredit[o], col = "green", lwd = 2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim et tronc_diam : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$age_estim + data_1$tronc_diam)
summary(model) #0.01983 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim+tronc_diam, data = data_1, family = binomial)
summary(model)

plot(data_1$age_estim, data_1$fk_arb_etat, col = "blue")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "red")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ age_estim + tronc_diam, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$age_estim + data_1$tronc_diam)
lines((data_1$age_estim + data_1$tronc_diam)[o], ypredit[o], col = "green", lwd = 2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot et haut_tronc : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$haut_tot + data_1$haut_tronc)
summary(model) #0.01307 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tot+haut_tronc, data = data_1, family = binomial)
summary(model)

plot(data_1$haut_tot, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tronc, data_1$fk_arb_etat, col = "red")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ haut_tot + haut_tronc, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$haut_tot + data_1$haut_tronc)
lines((data_1$haut_tot + data_1$haut_tronc)[o], ypredit[o], col = "green", lwd = 2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot et tronc_diam : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$haut_tot + data_1$tronc_diam)
summary(model) #0.01839 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tot+tronc_diam, data = data_1, family = binomial)
summary(model)

plot(data_1$haut_tot, data_1$fk_arb_etat, col = "blue")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "red")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ haut_tot + tronc_diam, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$haut_tot + data_1$tronc_diam)
lines((data_1$haut_tot + data_1$tronc_diam)[o], ypredit[o], col = "green", lwd = 2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tronc et tronc_diam : ------------------------------ 
# ---------------------------------------------------------------------------------

#On regarde sur le model peut etre comparer, avec le R carré, plus il est proche de 1, plus le résulat sera cohérent
model <- lm(data_1$fk_arb_etat~data_1$haut_tronc + data_1$tronc_diam)
summary(model) #0.01764 Pas intéressant

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tronc+tronc_diam, data = data_1, family = binomial)
summary(model)

plot(data_1$haut_tronc, data_1$fk_arb_etat, col = "blue")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "red")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ haut_tronc + tronc_diam, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$haut_tronc + data_1$tronc_diam)
lines((data_1$haut_tronc + data_1$tronc_diam)[o], ypredit[o], col = "green", lwd = 2)






# ---------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim, haut_tot : ------------------------------ 
# ---------------------------------------------------------------------------------
