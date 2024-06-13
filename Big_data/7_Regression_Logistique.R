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

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim, data = data_1, family = binomial)
summary(model)

#On obtient :
#Intercept estimate = -3.047476
#age_estime estimate = 0.018954

logit_ypredit= 0.018954*data_1$age_estim -3.047476
ypredit=exp(logit_ypredit)/(1+ exp(logit_ypredit)) # transfo inverse de logit

plot(data_1$age_estim,data_1$fk_arb_etat)
o=order(data_1$age_estim)
points(data_1$age_estim[o],ypredit[o], col="red", type="l", lwd=2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot : ------------------------------ 
# ---------------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tot, data = data_1, family = binomial)
summary(model)

#Affichage

plot(data_1$haut_tot, data_1$fk_arb_etat)
myreg=glm(data_1$fk_arb_etat~data_1$haut_tot, family=binomial(link=logit))
ypredit=myreg$fitted
o=order(data_1$haut_tot)
points(data_1$haut_tot[o],ypredit[o], col="red", type="l", lwd=2)

# ---------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tronc : ------------------------------ 
# ---------------------------------------------------------------------------------

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

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ tronc_diam, data = data_1, family = binomial)
summary(model)

#Affichage

plot(data_1$tronc_diam, data_1$fk_arb_etat)
myreg=glm(data_1$fk_arb_etat~data_1$tronc_diam, family=binomial(link=logit))
ypredit=myreg$fitted
o=order(data_1$tronc_diam)
points(data_1$tronc_diam[o],ypredit[o], col="red", type="l", lwd=2)






# ---------------------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim et haut_tot : ------------------------------ 
# ---------------------------------------------------------------------------------------------

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

# -----------------------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim et haut_tronc : ------------------------------ 
# -----------------------------------------------------------------------------------------------

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

# -----------------------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim et tronc_diam : ------------------------------ 
# -----------------------------------------------------------------------------------------------

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

# ----------------------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot et haut_tronc : ------------------------------ 
# ----------------------------------------------------------------------------------------------

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

# ----------------------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot et tronc_diam : ------------------------------ 
# ----------------------------------------------------------------------------------------------

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

# ------------------------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tronc et tronc_diam : ------------------------------ 
# ------------------------------------------------------------------------------------------------

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






# -------------------------------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim, haut_tot, haut_tronc : ------------------------------ 
# -------------------------------------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim+haut_tot+haut_tronc, data = data_1, family = binomial)
summary(model)

plot(data_1$age_estim, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tot, data_1$fk_arb_etat, col = "red")
points(data_1$haut_tronc, data_1$fk_arb_etat, col = "green")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ age_estim + haut_tot+haut_tronc, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$age_estim + data_1$haut_tot + data_1$haut_tronc)
lines((data_1$age_estim + data_1$haut_tot + data_1$haut_tronc)[o], ypredit[o], col = "purple", lwd = 2)

# -------------------------------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim, haut_tot, tronc_diam : ------------------------------ 
# -------------------------------------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim+haut_tot+tronc_diam, data = data_1, family = binomial)
summary(model)

plot(data_1$age_estim, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tot, data_1$fk_arb_etat, col = "red")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "green")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ age_estim + haut_tot+tronc_diam, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$age_estim + data_1$haut_tot + data_1$tronc_diam)
lines((data_1$age_estim + data_1$haut_tot + data_1$tronc_diam)[o], ypredit[o], col = "purple", lwd = 2)

# -------------------------------------------------------------------------------------------------------
# ------------------------------ Pour le age_estim, haut_tronc, tronc_diam : ------------------------------ 
# -------------------------------------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ age_estim+haut_tronc+tronc_diam, data = data_1, family = binomial)
summary(model)

plot(data_1$age_estim, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tronc, data_1$fk_arb_etat, col = "red")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "green")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ age_estim + haut_tronc+tronc_diam, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$age_estim + data_1$haut_tronc + data_1$tronc_diam)
lines((data_1$age_estim + data_1$haut_tronc + data_1$tronc_diam)[o], ypredit[o], col = "purple", lwd = 2)

# -------------------------------------------------------------------------------------------------------
# ------------------------------ Pour le haut_tot, haut_tronc, tronc_diam : ------------------------------ 
# -------------------------------------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tot+haut_tronc+tronc_diam, data = data_1, family = binomial)
summary(model)

plot(data_1$haut_tot, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tronc, data_1$fk_arb_etat, col = "red")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "green")

# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ haut_tot + haut_tronc+tronc_diam, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$haut_tot + data_1$haut_tronc + data_1$tronc_diam)
lines((data_1$haut_tot + data_1$haut_tronc + data_1$tronc_diam)[o], ypredit[o], col = "purple", lwd = 2)






# -------------------------------------------------------------------------------------------------------
# ------------------------------ Pour age_estime, haut_tot, haut_tronc, tronc_diam : ------------------------------ 
# -------------------------------------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ haut_tot+haut_tronc+tronc_diam+age_estim, data = data_1, family = binomial)
summary(model)

plot(data_1$haut_tot, data_1$fk_arb_etat, col = "blue")
points(data_1$haut_tronc, data_1$fk_arb_etat, col = "red")
points(data_1$tronc_diam, data_1$fk_arb_etat, col = "green")
points(data_1$tronc_diam, data_1$age_estim, col = "black")


# Tracer la courbe de régression logistique
myreg <- glm(fk_arb_etat ~ haut_tot + haut_tronc+tronc_diam+age_estim, data = data_1, family = binomial(link = logit))
ypredit <- myreg$fitted
o <- order(data_1$haut_tot + data_1$haut_tronc + data_1$tronc_diam+ data_1$age_estim)
lines((data_1$haut_tot + data_1$haut_tronc + data_1$tronc_diam + data_1$age_estim)[o], ypredit[o], col = "purple", lwd = 2)






# --------------------------------------------------------------------------
# ------------------------------ Trouver R2 : ------------------------------ 
# --------------------------------------------------------------------------

# Modèle de régression logistique
model <- glm(fk_arb_etat ~ clc_quartier + clc_secteur + fk_stadedev + fk_port + fk_pied + fk_situation + fk_revetement + haut_tot + haut_tronc+ tronc_diam +age_estim, data = data_1, family = binomial)
summary(model)

columns <- c("clc_quartier","fk_arb_etat","fk_stadedev","fk_port","fk_pied",
             "fk_situation","fk_revetement", "feuillage","remarquable")


#Le simulate.p.value est utilisé souvent lorsqu'on a des données manquantes
#ou quand nous avons pas beaucoup de données et permet d'avoir une plus grande précisions. 
#Dans notre cas, nous avons rajouter des données mais elles sont considérées comme manquantes.
#C'est pour cela que nous allons faire avec les 2 méthodes

for (i in 1:(length(columns)-1)) {
  
  for (j in (i+1):length(columns)) {
    
    print("")
    print("--------------------------------------------------------------")
    print("")
    
    # ----- Création du tableau croisé : -----
    tableau_croise <- table(data[[columns[i]]], data[[columns[j]]])
    print(paste("Tableau croisé entre", columns[i], "et", columns[j]))
    #print(tableau_croise)
    
    # ----- Test du chi2 : -----  
    
    #METHODE SANS SIMULATE.P.VALUE :
    avec_simulate__chisq <- chisq.test(tableau_croise, simulate.p.value = TRUE)
    
    #METHODE AVEC SIMULATE.P.VALUE :
    sans_simulate__chisq <- chisq.test(tableau_croise)
    
  }
  
}
