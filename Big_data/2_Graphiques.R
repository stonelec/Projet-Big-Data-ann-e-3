# |        ==============================================        | 
# | ============================================================ |
# |=====================| NUAGES DE POINTS |=====================|
# | ============================================================ |
# |        ==============================================        |  


# | -------------------------------------------------------- |
# |------| Corélations avec le stade de développement |------|
# | -------------------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_stade_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_stadedev)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_stade_1
# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_stade_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = fk_stadedev)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_stade_2
# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_stade_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_stade_3
# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_stade_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = fk_stadedev))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_stade_4

# | -------------------------------------------------- |
# |------| Corélations avec la forme de l'arbre |------|
# | -------------------------------------------------- | 
  
# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_port_2 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_port_2

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_port_3 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = fk_port)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_port_3

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_port_4 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = fk_port))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_port_4
# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_port_1 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = fk_port))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_port_1
  
# | ------------------------------------------ |
# |------| Corélations avec le quartier |------|
# | ------------------------------------------ | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_quartier_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_quartier_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_quartier_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = clc_quartier)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_quartier_2

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_quartier_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = clc_quartier))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_quartier_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_quartier_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = clc_quartier))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_quartier_4
  
# | ------------------------------------------- |
# |------| Corélations avec le feuillage |------|
# | ------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_feuillage_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_feuillage_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_feuillage_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = feuillage)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_feuillage_2

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_feuillage_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = feuillage))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_feuillage_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_feuillage_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = feuillage))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_feuillage_4

# | --------------------------------------------------- |
# |------| Corélations avec le paramètre villeca |------|
# | --------------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_villeca_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_villeca_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_villeca_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = villeca)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_villeca_2

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_villeca_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = villeca))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_villeca_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_villeca_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = villeca))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_villeca_4


# | --------------------------------------------- |
# |------| Corélations avec le type de sol |------|
# | --------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_pied_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_pied_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_pied_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = fk_pied)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_pied_2

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_pied_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = fk_pied))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_pied_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_pied_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = fk_pied))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_pied_4


# | ---------------------------------------------------- |
# |------| Corélations avec le type de revetement |------|
# | ---------------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_revetement_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_revetement_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_revetement_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = fk_revetement)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_revetement_

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_revetement_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = fk_revetement))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_revetement_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_revetement_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = fk_revetement))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_revetement_4


# | ------------------------------------------------------------- |
# |------| Corélations avec la caractéristique remarquable |------|
# | ------------------------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_remarquable_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_remarquable_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_remarquable_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = remarquable)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_remarquable_2

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_remarquable_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = remarquable))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_remarquable_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_remarquable_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = remarquable))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_remarquable_4


# | ------------------------------------------- |
# |------| Corélations avec la situation |------|
# | ------------------------------------------- | 

# ---------- Entre la hauteur du tronc et le diamètre du tronc ----------
nuage_situation_1 <- ggplot(data, aes(x=haut_tronc, y=tronc_diam, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction du diamètre du tronc") +
  xlab("Hauteur du tronc") +
  ylab("Diamètre du tronc")

nuage_situation_1

# ---------- Entre la hauteur totale et la hauteur du tronc ----------
nuage_situation_2 <- ggplot(data, aes(x=haut_tronc, y=haut_tot, color = fk_situation)) +
  geom_point() +
  ggtitle("Hauteur du tonc en fonction de la hauteur totale") +
  xlab("Hauteur totale") +
  ylab("Hauteur du tronc")

nuage_situation_2

# ---------- Entre la hauteur totale et l'âge estimé ----------
nuage_situation_3 <- ggplot(data, aes(x=age_estim, y=haut_tot, color = fk_situation))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Hauteur totale")

nuage_situation_3

# ---------- Entre le diamètre du tronc et l'âge estimé ----------
nuage_situation_4 <- ggplot(data, aes(x=age_estim, y=tronc_diam, color = fk_situation))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de l'âge estimé") +
  xlab("Age estim") +
  ylab("Diamètre du tronc")

nuage_situation_4


# |        =================================================        | 
# | =============================================================== |
# |=====================| DIAGRAMME EN POINTS |=====================|
# | =============================================================== |
# |        =================================================        | 

# | -------------------------------------------------------- |
# |------| Corélations avec le stade de développement |------|
# | -------------------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_stade_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = fk_stadedev))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_stade_1

# ---------- Entre le stade de développement et la hauteur totale ----------
diagramme_stade_2 <- ggplot(data, aes(x=fk_stadedev, y=haut_tot, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du stade de développement") +
  xlab("Stade de developpement") +
  ylab("Hauteur totale")

diagramme_stade_2

# ---------- Entre le stade de développement et la hauteur du tonc ----------
diagramme_stade_3 <- ggplot(data, aes(x=fk_stadedev, y=haut_tronc, color = fk_stadedev))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du stade de développement") +
  xlab("Stade de developpement") +
  ylab("Hauteur du tronc")

diagramme_stade_3

# ---------- Entre le stade de développement et le diamètre du tonc ----------
diagramme_stade_4 <- ggplot(data, aes(x=fk_stadedev, y=tronc_diam, color = fk_stadedev))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du stade de développement") +
  xlab("Stade de developpement") +
  ylab("Diamètre du tronc")

diagramme_stade_4


# | -------------------------------------------------- |
# |------| Corélations avec la forme de l'arbre |------|
# | -------------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_port_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = fk_port))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_port_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_port_2 <- ggplot(data, aes(x=fk_port, y=age_estim, color = fk_port))+
  geom_point() +
  ggtitle("Age estime en fonction de la forme de l'arbre") +
  xlab("Forme de l'arbre") +
  ylab("Age estime")

diagramme_port_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_port_3 <- ggplot(data, aes(x=fk_port, y=haut_tot, color = fk_port))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de la forme de l'arbre") +
  xlab("Forme de l'arbre") +
  ylab("Hauteur totale")

diagramme_port_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_port_4 <- ggplot(data, aes(x=fk_port, y=haut_tronc, color = fk_port))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la forme de l'arbre") +
  xlab("Stade de developpement") +
  ylab("Forme de l'arbre")

diagramme_port_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_port_5 <- ggplot(data, aes(x=fk_port, y=tronc_diam, color = fk_port))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la forme de l'arbre") +
  xlab("Stade de developpement") +
  ylab("Forme de l'arbre")

diagramme_port_5


# | ------------------------------------------ |
# |------| Corélations avec le quartier |------|
# | ------------------------------------------ | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_quartier_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = clc_quartier))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_quartier_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_quartier_2 <- ggplot(data, aes(x=clc_quartier, y=age_estim, color = clc_quartier))+
  geom_point() +
  ggtitle("Age estime en fonction du quartier") +
  xlab("Quartier") +
  ylab("Age estime")

diagramme_quartier_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_quartier_3 <- ggplot(data, aes(x=clc_quartier, y=haut_tot, color = clc_quartier))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du quartier") +
  xlab("Quartier") +
  ylab("Hauteur totale")

diagramme_quartier_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_quartier_4 <- ggplot(data, aes(x=clc_quartier, y=haut_tronc, color = clc_quartier))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du quartier") +
  xlab("Quartier") +
  ylab("Hauteur du tronc")

diagramme_quartier_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_quartier_5 <- ggplot(data, aes(x=clc_quartier, y=tronc_diam, color = clc_quartier))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du quartier") +
  xlab("Quartier") +
  ylab("Diamètre du tronc")

diagramme_quartier_5

# | ------------------------------------------- |
# |------| Corélations avec le feuillage |------|
# | ------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_feuillage_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = feuillage))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_feuillage_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_feuillage_2 <- ggplot(data, aes(x=feuillage, y=age_estim, color = feuillage))+
  geom_point() +
  ggtitle("Age estime en fonction du feuillage") +
  xlab("Feuillage") +
  ylab("Age estime")

diagramme_feuillage_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_feuillage_3 <- ggplot(data, aes(x=feuillage, y=haut_tot, color = feuillage))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du feuillage") +
  xlab("Feuillage") +
  ylab("Hauteur totale")

diagramme_feuillage_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_feuillage_4 <- ggplot(data, aes(x=feuillage, y=haut_tronc, color = feuillage))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du feuillage") +
  xlab("Feuillage") +
  ylab("Hauteur du tronc")

diagramme_feuillage_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_feuillage_5 <- ggplot(data, aes(x=feuillage, y=tronc_diam, color = feuillage))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du feuillage") +
  xlab("Stade de developpement") +
  ylab("Diamètre du tronc")

diagramme_feuillage_5

# | --------------------------------------------------- |
# |------| Corélations avec le paramètre villeca |------|
# | --------------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_villeca_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = villeca))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_villeca_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_villeca_2 <- ggplot(data, aes(x=villeca, y=age_estim, color = villeca))+
  geom_point() +
  ggtitle("Age estime en fonction de la villeca") +
  xlab("Villeca") +
  ylab("Age estime")

diagramme_villeca_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_villeca_3 <- ggplot(data, aes(x=villeca, y=haut_tot, color = villeca))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de la villeca") +
  xlab("Villeca") +
  ylab("Hauteur totale")

diagramme_villeca_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_villeca_4 <- ggplot(data, aes(x=villeca, y=haut_tronc, color = villeca))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la villeca") +
  xlab("Villeca") +
  ylab("Hauteur du tronc")

diagramme_villeca_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_villeca_5 <- ggplot(data, aes(x=villeca, y=tronc_diam, color = villeca))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la villeca") +
  xlab("Villeca") +
  ylab("Diamètre du tronc")

diagramme_villeca_5


# | --------------------------------------------- |
# |------| Corélations avec le type de sol |------|
# | --------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_pied_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = fk_pied))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_pied_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_pied_2 <- ggplot(data, aes(x=fk_pied, y=age_estim, color = fk_pied))+
  geom_point() +
  ggtitle("Age estime en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Age estime")

diagramme_pied_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_pied_3 <- ggplot(data, aes(x=fk_pied, y=haut_tot, color = fk_pied))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Hauteur totale")

diagramme_pied_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_pied_4 <- ggplot(data, aes(x=fk_pied, y=haut_tronc, color = fk_pied))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Hauteur du tronc")

diagramme_pied_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_pied_5 <- ggplot(data, aes(x=fk_pied, y=tronc_diam, color = fk_pied))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du type de sol") +
  xlab("Type de sol") +
  ylab("Diamètre du tronc")

diagramme_pied_5


# | ---------------------------------------------------- |
# |------| Corélations avec le type de revetement |------|
# | ---------------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_revetement_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = fk_revetement))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_revetement_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_revetement_2 <- ggplot(data, aes(x=fk_revetement, y=age_estim, color = fk_revetement))+
  geom_point() +
  ggtitle("Age estime en fonction du revetement") +
  xlab("Revetement") +
  ylab("Age estime")

diagramme_revetement_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_revetement_3 <- ggplot(data, aes(x=fk_revetement, y=haut_tot, color = fk_revetement))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du revetement") +
  xlab("Revetement") +
  ylab("Hauteur totale")

diagramme_revetement_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_revetement_4 <- ggplot(data, aes(x=fk_revetement, y=haut_tronc, color = fk_revetement))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du revetement") +
  xlab("Revetement") +
  ylab("Hauteur du tronc")

diagramme_revetement_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_revetement_5 <- ggplot(data, aes(x=fk_revetement, y=tronc_diam, color = fk_revetement))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du revetement") +
  xlab("Revetement") +
  ylab("Diamètre du tronc")

diagramme_revetement_5


# | ------------------------------------------------------------- |
# |------| Corélations avec la caractéristique remarquable |------|
# | ------------------------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_remarquable_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = remarquable))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_remarquable_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_remarquable_2 <- ggplot(data, aes(x=remarquable, y=age_estim, color = remarquable))+
  geom_point() +
  ggtitle("Age estime en fonction du caractère remarquable") +
  xlab("Remarquable") +
  ylab("Age estime")

diagramme_remarquable_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_remarquable_3 <- ggplot(data, aes(x=remarquable, y=haut_tot, color = remarquable))+
  geom_point() +
  ggtitle("Hauteur totale en fonction du caractère remarquable") +
  xlab("Remarquable") +
  ylab("Hauteur totale")

diagramme_remarquable_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_remarquable_4 <- ggplot(data, aes(x=remarquable, y=haut_tronc, color = remarquable))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction du caractère remarquable") +
  xlab("Remarquable") +
  ylab("Hauteur du tronc")

diagramme_remarquable_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_remarquable_5 <- ggplot(data, aes(x=remarquable, y=tronc_diam, color = remarquable))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction du caractère remarquable") +
  xlab("Remarquable") +
  ylab("Diamètre du tronc")

diagramme_remarquable_5


# | ------------------------------------------- |
# |------| Corélations avec la situation |------|
# | ------------------------------------------- | 

# ---------- Entre le stade de développement et l'âge estimé ----------
diagramme_situation_1 <- ggplot(data, aes(x=fk_stadedev, y=age_estim, color = fk_situation))+
  geom_point() +
  ggtitle("Age estimé en fonction du stade de développement") +
  xlab("Stade de développement") +
  ylab("Age estim")

diagramme_situation_1

# ---------- Comparaison avec l'âge estimé ----------
diagramme_situation_2 <- ggplot(data, aes(x=fk_situation, y=age_estim, color = fk_situation))+
  geom_point() +
  ggtitle("Age estime en fonction de la situation") +
  xlab("Situation") +
  ylab("Age estime")

diagramme_situation_2

# ---------- Comparaison avec la hauteur totale ----------
diagramme_situation_3 <- ggplot(data, aes(x=fk_situation, y=haut_tot, color = fk_situation))+
  geom_point() +
  ggtitle("Hauteur totale en fonction de la situation") +
  xlab("Situation") +
  ylab("Hauteur totale")

diagramme_situation_3

# ---------- Comparaison avec la hauteur du tonc ----------
diagramme_situation_4 <- ggplot(data, aes(x=fk_situation, y=haut_tronc, color = fk_situation))+
  geom_point() +
  ggtitle("Hauteur du tronc en fonction de la situation") +
  xlab("Situation") +
  ylab("Hauteur du tronc")

diagramme_situation_4

# ---------- Comparaison avec le diamètre du tonc ----------
diagramme_situation_5 <- ggplot(data, aes(x=fk_situation, y=tronc_diam, color = fk_situation))+
  geom_point() +
  ggtitle("Diamètre du tronc en fonction de la situation") +
  xlab("Situation") +
  ylab("Diamètre du tronc")

diagramme_situation_5

