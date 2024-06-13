# | ==================================================================== |
# |============| Statistiques pour toute la base de données |============|
# | ==================================================================== |

# Calcul des statistiques pour chaque variable
table_age_estim <- data %>%
  summarise(
    Moyenne = mean(age_estim, na.rm = TRUE),
    Médiane = median(age_estim, na.rm = TRUE),
    Écart_type = sd(age_estim, na.rm = TRUE),
    Maximum = max(age_estim, na.rm = TRUE),
    Minimum = min(age_estim, na.rm = TRUE)
  )

table_haut_tot <- data %>%
  summarise(
    Moyenne = mean(haut_tot, na.rm = TRUE),
    Médiane = median(haut_tot, na.rm = TRUE),
    Écart_type = sd(haut_tot, na.rm = TRUE),
    Maximum = max(haut_tot, na.rm = TRUE),
    Minimum = min(haut_tot, na.rm = TRUE)
  )

table_haut_tronc <- data %>%
  summarise(
    Moyenne = mean(haut_tronc, na.rm = TRUE),
    Médiane = median(haut_tronc, na.rm = TRUE),
    Écart_type = sd(haut_tronc, na.rm = TRUE),
    Maximum = max(haut_tronc, na.rm = TRUE),
    Minimum = min(haut_tronc, na.rm = TRUE)
  )

table_tronc_diam <- data %>%
  summarise(
    Moyenne = mean(tronc_diam, na.rm = TRUE),
    Médiane = median(tronc_diam, na.rm = TRUE),
    Écart_type = sd(tronc_diam, na.rm = TRUE),
    Maximum = max(tronc_diam, na.rm = TRUE),
    Minimum = min(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats
print("Statistiques pour 'age_estim':")
table_age_estim

print("Statistiques pour 'haut_tot':")
table_haut_tot

print("Statistiques pour 'haut_tronc':")
table_haut_tronc

print("Statistiques pour 'tronc_diam':")
table_tronc_diam




# | ============================================================== |
# |============| Statistiques en fonction du quartier |============|
# | ============================================================== |

# ------------------- Age estimé ------------------- 
table_age_estim_quartiers <- data %>%
  group_by(clc_quartier) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )  

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_quartiers

# ------------------- Hauteur totale -------------------
table_haut_tot_quartiers <- data %>%
  group_by(clc_quartier) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_quartiers

# ------------------- Hauteur tronc -------------------
table_haut_tronc_quartiers <- data %>%
  group_by(clc_quartier) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_quartiers

# ------------------- Diamètre tronc -------------------
table_tronc_diam_quartiers <- data %>%
  group_by(clc_quartier) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_quartiers



# | ============================================================== |
# |============| Statistiques en fonction du secteur |============|
# | ============================================================== |

# ------------------- Age estimé ------------------- 
table_age_estim_secteurs <- data %>%
  group_by(clc_secteur) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )  

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_secteurs

# ------------------- Hauteur totale -------------------
table_haut_tot_secteurs <- data %>%
  group_by(clc_secteur) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_secteurs

# ------------------- Hauteur tronc -------------------
table_haut_tronc_secteurs <- data %>%
  group_by(clc_secteur) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_secteurs

# ------------------- Diamètre tronc -------------------
table_tronc_diam_secteurs <- data %>%
  group_by(clc_secteur) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_secteurs



# | ================================================================== |
# |============| Statistiques en fonction de la situation |============|
# | ================================================================== |

# ------------------- Age estimé ------------------- 
table_age_estim_situation <- data %>%
  group_by(fk_situation) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )  

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_situation

# ------------------- Hauteur totale -------------------
table_haut_tot_situation <- data %>%
  group_by(fk_situation) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_situation

# ------------------- Hauteur tronc -------------------
table_haut_tronc_situation <- data %>%
  group_by(fk_situation) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_situation

# ------------------- Diamètre tronc -------------------
table_tronc_diam_situation <- data %>%
  group_by(fk_situation) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_situation



# | =============================================================== |
# |============| Statistiques en fonction du feuillage |============|
# | =============================================================== |

# ------------------- Age estimé ------------------- 
table_age_estim_feuillage <- data %>%
  group_by(feuillage) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )  

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_feuillage

# ------------------- Hauteur totale -------------------
table_haut_tot_feuillage <- data %>%
  group_by(feuillage) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_feuillage

# ------------------- Hauteur tronc -------------------
table_haut_tronc_feuillage <- data %>%
  group_by(feuillage) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_feuillage

# ------------------- Diamètre tronc -------------------
table_tronc_diam_feuillage <- data %>%
  group_by(feuillage) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_feuillage



# | ================================================================ |
# |============| Statistiques en fonction du revêtement |============|
# | ================================================================ |

# ------------------- Age estimé ------------------- 
table_age_estim_revetement <- data %>%
  group_by(fk_revetement) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )  

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_revetement

# ------------------- Hauteur totale -------------------
table_haut_tot_revetement <- data %>%
  group_by(fk_revetement) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_revetement

# ------------------- Hauteur tronc -------------------
table_haut_tronc_revetement <- data %>%
  group_by(fk_revetement) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_revetement

# ------------------- Diamètre tronc -------------------
table_tronc_diam_revetement <- data %>%
  group_by(fk_revetement) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )
# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_revetement



# | =========================================================================== |
# |============| Statistiques en fonction du caractère remarquable |============|
# | =========================================================================== |

# ------------------- Age estimé ------------------- 
table_age_estim_remarquable <- data %>%
  group_by(remarquable) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )   

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_remarquable

# ------------------- Hauteur totale -------------------
table_haut_tot_remarquable <- data %>%
  group_by(remarquable) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_remarquable

# ------------------- Hauteur tronc -------------------
table_haut_tronc_remarquable <- data %>%
  group_by(remarquable) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_remarquable

# ------------------- Diamètre tronc -------------------
table_tronc_diam_remarquable <- data %>%
  group_by(remarquable) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_remarquable



# | ========================================================================= |
# |============| Statistiques en fonction de la forme de l'arbre |============|
# | ========================================================================= |

# ------------------- Age estimé ------------------- 
table_age_estim_port <- data %>%
  group_by(fk_port) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  ) 
# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_port 

# ------------------- Hauteur totale -------------------
table_haut_tot_port <- data %>%
  group_by(fk_port) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_port

# ------------------- Hauteur tronc -------------------
table_haut_tronc_port <- data %>%
  group_by(fk_port) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_port

# ------------------- Diamètre tronc -------------------
table_tronc_diam_port <- data %>%
  group_by(fk_port) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )
# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_port



# | ================================================================= |
# |============| Statistiques en fonction du type de sol |============|
# | ================================================================= |

# ------------------- Age estimé ------------------- 
table_age_estim_pied <- data %>%
  group_by(fk_pied) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )  

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_pied

# ------------------- Hauteur totale -------------------
table_haut_tot_pied <- data %>%
  group_by(fk_pied) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_pied

# ------------------- Hauteur tronc -------------------
table_haut_tronc_pied <- data %>%
  group_by(fk_pied) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_pied

# ------------------- Diamètre tronc -------------------
table_tronc_diam_pied <- data %>%
  group_by(fk_pied) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_pied



# | ============================================================ |
# |============| Statistiques en fonction de l'état |============|
# | ============================================================ |

# ------------------- Age estimé ------------------- 
table_age_estim_etat <- data %>%
  group_by(fk_arb_etat) %>%
  summarise(
    age_moyenne = mean(age_estim, na.rm = TRUE),
    age_mediane = median(age_estim, na.rm = TRUE),
    age_ecart_type = sd(age_estim, na.rm = TRUE),
    age_minimum = min(age_estim, na.rm = TRUE),
    age_maximum = max(age_estim, na.rm = TRUE)
  )   

# Affichage des résultats pour age_estim
print("Tableau des statistiques pour l'age_estim")
table_age_estim_etat
# ------------------- Hauteur totale -------------------
table_haut_tot_etat <- data %>%
  group_by(fk_arb_etat) %>%
  summarise(
    hauteur_totale_moyenne = mean(haut_tot, na.rm = TRUE),
    hauteur_totale_mediane = median(haut_tot, na.rm = TRUE),
    hauteur_totale_ecart_type = sd(haut_tot, na.rm = TRUE),
    hauteur_totale_minimum = min(haut_tot, na.rm = TRUE),
    hauteur_totale_maximum = max(haut_tot, na.rm = TRUE)
  )

# Affichage des résultats pour haut_tot
print("Tableau des statistiques pour la hauteur totale (haut_tot)")
table_haut_tot_etat

# ------------------- Hauteur tronc -------------------
table_haut_tronc_etat <- data %>%
  group_by(fk_arb_etat) %>%
  summarise(
    hauteur_tronc_moyenne = mean(haut_tronc, na.rm = TRUE),
    hauteur_tronc_mediane = median(haut_tronc, na.rm = TRUE),
    hauteur_tronc_ecart_type = sd(haut_tronc, na.rm = TRUE),
    hauteur_tronc_minimum = min(haut_tronc, na.rm = TRUE),
    hauteur_tronc_maximum = max(haut_tronc, na.rm = TRUE)
  )
# Affichage des résultats pour haut_tronc
print("Tableau des statistiques pour la hauteur du tronc (haut_tronc)")
table_haut_tronc_etat

# ------------------- Diamètre tronc -------------------
table_tronc_diam_etat <- data %>%
  group_by(fk_arb_etat) %>%
  summarise(
    tronc_diametre_moyenne = mean(tronc_diam, na.rm = TRUE),
    tronc_diametre_mediane = median(tronc_diam, na.rm = TRUE),
    tronc_diametre_ecart_type = sd(tronc_diam, na.rm = TRUE),
    tronc_diametre_minimum = min(tronc_diam, na.rm = TRUE),
    tronc_diametre_maximum = max(tronc_diam, na.rm = TRUE)
  )

# Affichage des résultats pour tronc_diam
print("Tableau des statistiques pour le diamètre du tronc (tronc_diam)")
table_tronc_diam_etat

