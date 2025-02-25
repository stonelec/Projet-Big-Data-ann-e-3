# -----------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction du quartier ----------------------------------------
# -----------------------------------------------------------------------------------------------------------------

# ----- Affichage des stades de développement en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_stadedev, clc_quartier) %>%
  summarize(counts_function = n())

matrice_dev_quartier <- ggplot(counts_function, aes(x = fk_stadedev, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +   # Dégradé de couleur pour les tuiles
  ggtitle("Etats des stades de développement en fonction des quartiers") +
  xlab("Satde de développement") +
  ylab("Quartiers") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

matrice_dev_quartier

# ----- Affichage des états en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_arb_etat, clc_quartier) %>%
  summarize(counts_function = n())

matrice_etat_quartier <- ggplot(counts_function, aes(x = fk_arb_etat, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +   # Dégradé de couleur pour les tuiles
  ggtitle("Etats des arbres en fonction des quartiers") +
  xlab("Etats") +
  ylab("Quartiers") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_etat_quartier

# ----- Affichage de l'age en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_stadedev, clc_quartier) %>%
  summarize(counts_function = n())

matrice_stade_quartier <- ggplot(counts_function, aes(x = fk_stadedev, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de l'intersection de fk_stadedev et clc_quartier") +
  xlab("fk_stadedev") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

matrice_stade_quartier

# ----- Affichage de l'apparence de l'abre en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_port, clc_quartier) %>%
  summarize(counts_function = n())

matrice_port_quartier <- ggplot(counts_function, aes(x = fk_port, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de l'intersection de fk_port et clc_quartier") +
  xlab("fk_port") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_port_quartier

# ----- Affichage de comment sont les pieds de l'abre en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_pied, clc_quartier) %>%
  summarize(counts_function = n())

matrice_pied_quartier <- ggplot(counts_function, aes(x = fk_pied, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_pied et clc_quartier") +
  xlab("fk_pied") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_pied_quartier

# ----- Affichage de la situation en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_situation, clc_quartier) %>%
  summarize(counts_function = n())

matrice_situation_quartier <- ggplot(counts_function, aes(x = fk_situation, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_situation et clc_quartier") +
  xlab("fk_situation") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_situation_quartier

# ----- Affichage du revetement en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_revetement, clc_quartier) %>%
  summarize(counts_function = n())

matrice_revetement_quartier <- ggplot(counts_function, aes(x = fk_revetement, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_revetement et clc_quartier") +
  xlab("fk_revetement") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_revetement_quartier

# ----- Affichage du feuillage en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(feuillage, clc_quartier) %>%
  summarize(counts_function = n())

matrice_feuillage_quartier <- ggplot(counts_function, aes(x = feuillage, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et clc_quartier") +
  xlab("feuillage") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_quartier

# ---------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction de l'état ----------------------------------------
# ---------------------------------------------------------------------------------------------------------------

# ----- Affichage du stade de developpement en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(fk_stadedev, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_stade_etat <- ggplot(counts_function, aes(x = fk_stadedev, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_stadedev et fk_arb_etat") +
  xlab("fk_stadedev") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_stade_etat

# ----- Affichage de la situation en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(fk_situation, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_situation_etat <- ggplot(counts_function, aes(x = fk_situation, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_situation et fk_arb_etat") +
  xlab("fk_situation") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_situation_etat

# ----- Affichage du revetement en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(fk_revetement, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_revetement_etat <- ggplot(counts_function, aes(x = fk_revetement, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_revetement et fk_arb_etat") +
  xlab("fk_revetement") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_revetement_etat

# ----- Affichage de l'apparence de l'arbre en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(fk_port, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_port_etat <- ggplot(counts_function, aes(x = fk_port, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_port et fk_arb_etat") +
  xlab("fk_port") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_port_etat

# ----- Affichage de l'apparence de l'arbre en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(fk_pied, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_pied_etat <- ggplot(counts_function, aes(x = fk_pied, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_pied et fk_arb_etat") +
  xlab("fk_pied") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_pied_etat

# ----- Affichage du feuillage en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_feuillage_etat <- ggplot(counts_function, aes(x = feuillage, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_arb_etat") +
  xlab("feuillage") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_etat

# -------------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction du stade de developpement ----------------------------------------
# -------------------------------------------------------------------------------------------------------------------------------

# ----- Affichage du stade du revetement en fonction du stade de developpement : ----- 

counts_function <- data %>%
  group_by(fk_revetement, fk_stadedev) %>%
  summarize(counts_function = n())

matrice_revetement_stade <- ggplot(counts_function, aes(x = fk_revetement, y = fk_stadedev)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_revetement et fk_stadedev") +
  xlab("fk_revetement") +
  ylab("fk_stadedev") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_revetement_stade

# ----- Affichage de l'apparence en fonction du stade de developpement : ----- 

counts_function <- data %>%
  group_by(fk_port, fk_stadedev) %>%
  summarize(counts_function = n())

matrice_port_stade <- ggplot(counts_function, aes(x = fk_port, y = fk_stadedev)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_port et fk_stadedev") +
  xlab("fk_port") +
  ylab("fk_stadedev") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_port_stade

# ----- Affichage de pied en fonction du stade de developpement : ----- 

counts_function <- data %>%
  group_by(fk_pied, fk_stadedev) %>%
  summarize(counts_function = n())

matrice_pied_stade <- ggplot(counts_function, aes(x = fk_pied, y = fk_stadedev)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_pied et fk_stadedev") +
  xlab("fk_pied") +
  ylab("fk_stadedev") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_pied_stade

# ----- Affichage de la situation en fonction du stade de developpement : ----- 

counts_function <- data %>%
  group_by(fk_situation, fk_stadedev) %>%
  summarize(counts_function = n())

matrice_situation_stade <- ggplot(counts_function, aes(x = fk_situation, y = fk_stadedev)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_situation et fk_stadedev") +
  xlab("fk_situation") +
  ylab("fk_stadedev") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_situation_stade

# ----- Affichage du feuillage en fonction du stade de developpement : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_stadedev) %>%
  summarize(counts_function = n())

matrice_feuillage_stade <- ggplot(counts_function, aes(x = feuillage, y = fk_stadedev)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_stadedev") +
  xlab("feuillage") +
  ylab("fk_stadedev") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_stade

# -----------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction du revetement --------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------

# ----- Affichage de l'apparence en fonction du revetement : ----- 

counts_function <- data %>%
  group_by(fk_port, fk_revetement) %>%
  summarize(counts_function = n())

matrice_port_revetement <- ggplot(counts_function, aes(x = fk_port, y = fk_revetement)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_port et fk_revetement") +
  xlab("fk_port") +
  ylab("fk_revetement") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_port_revetement

# ----- Affichage du pied en fonction du revetement : ----- 

counts_function <- data %>%
  group_by(fk_pied, fk_revetement) %>%
  summarize(counts_function = n())

matrice_pied_revetement <- ggplot(counts_function, aes(x = fk_pied, y = fk_revetement)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_pied et fk_revetement") +
  xlab("fk_pied") +
  ylab("fk_revetement") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_pied_revetement

# ----- Affichage de la situation en fonction du revetement : ----- 

counts_function <- data %>%
  group_by(fk_situation, fk_revetement) %>%
  summarize(counts_function = n())

matrice_situation_revetement <- ggplot(counts_function, aes(x = fk_situation, y = fk_revetement)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
  ggtitle("Nombre de valeurs en fonction de fk_situation et fk_revetement") +
  xlab("fk_situation") +
  ylab("fk_revetement") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_situation_revetement

# ----- Affichage du feuillage en fonction du revetement : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_revetement) %>%
  summarize(counts_function = n())

matrice_feuillage_revetement <- ggplot(counts_function, aes(x = feuillage, y = fk_revetement)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_revetement") +
  xlab("feuillage") +
  ylab("fk_revetement") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_revetement

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction de l'apparence (port) ----------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

# ----- Affichage du pied en fonction de l'apparence : ----- 

counts_function <- data %>%
  group_by(fk_pied, fk_port) %>%
  summarize(counts_function = n())

matrice_pied_port <- ggplot(counts_function, aes(x = fk_pied, y = fk_port)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_pied et fk_port") +
  xlab("fk_pied") +
  ylab("fk_port") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_pied_port

# ----- Affichage de la situation en fonction de l'apparence : ----- 

counts_function <- data %>%
  group_by(fk_situation, fk_port) %>%
  summarize(counts_function = n())

matrice_situation_port <- ggplot(counts_function, aes(x = fk_situation, y = fk_port)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_situation et fk_port") +
  xlab("fk_situation") +
  ylab("fk_port") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_situation_port

# ----- Affichage du feuillage en fonction de l'apparence : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_port) %>%
  summarize(counts_function = n())

matrice_feuillage_port <- ggplot(counts_function, aes(x = feuillage, y = fk_port)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_port") +
  xlab("feuillage") +
  ylab("fk_port") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_port

# -------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction du pied ----------------------------------------
# -------------------------------------------------------------------------------------------------------------

# ----- Affichage de la situation en fonction du pied : ----- 

counts_function <- data %>%
  group_by(fk_situation, fk_pied) %>%
  summarize(counts_function = n())

matrice_situation_pied <- ggplot(counts_function, aes(x = fk_situation, y = fk_pied)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de fk_situation et fk_pied") +
  xlab("fk_situation") +
  ylab("fk_pied") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_situation_pied

# ----- Affichage du feuillage en fonction du pied : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_pied) %>%
  summarize(counts_function = n())

matrice_feuillage_pied <- ggplot(counts_function, aes(x = feuillage, y = fk_pied)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_pied") +
  xlab("feuillage") +
  ylab("fk_pied") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_pied

# ----------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Matrice en fonction de la situation  ----------------------------------------
# ----------------------------------------------------------------------------------------------------------------------

# ----- Affichage du feuillage en fonction de la situation : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_situation) %>%
  summarize(counts_function = n())

matrice_feuillage_situation <- ggplot(counts_function, aes(x = feuillage, y = fk_situation)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_situation") +
  xlab("feuillage") +
  ylab("fk_situation") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_situation

# ---------------------------------------------------------------------------------------------------------
# ---------------------------------------- HISTOGRAMMES EN LIGNE : ----------------------------------------
# ---------------------------------------------------------------------------------------------------------

#Différents noms pour la création des histogrammes :

columns <- c("clc_quartier","haut_tot","haut_tronc","tronc_diam", "fk_arb_etat","fk_stadedev","fk_port","fk_pied",
             "fk_situation","fk_revetement", "age_estim", "feuillage","remarquable")

for (i in 1:(length(columns)-1)) {
  
  for (j in (i+1):length(columns)) {
    
    #Tableau croisé
    tableau <- table(data[[columns[i]]], data[[columns[j]]])
    
    #Convertion des valeurs
    tab <- as.data.frame(tableau)
    
    colnames(tab) <- c(columns[i], columns[j], "Freq")
    
    #Création du graphique
    graph <- ggplot(tab, aes_string(x = columns[i], y = "Freq", fill = columns[j])) +
      geom_bar(stat = "identity", position = "dodge") +
      theme_minimal() +
      labs(title = paste("Relation entre", columns[i] , "et", columns[j]),
           x = columns[i],
           y = "Fréquence") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    #Affichage du graphique :
    print(graph)
  }
  
}

# ---------------------------------------------------------------------------------------------------------
# ---------------------------------------- HISTOGRAMMES EMPILES : ----------------------------------------
# ---------------------------------------------------------------------------------------------------------

for (i in 1:(length(columns)-1)) {
  
  for (j in (i+1):length(columns)) {
    
    #Tableau croisé
    tableau <- table(data[[columns[i]]], data[[columns[j]]])
    
    #Convertion des valeurs
    tab <- as.data.frame(tableau)
    
    colnames(tab) <- c(columns[i], columns[j], "Freq")
    
    #Création du graphique
    graph <- ggplot(tab, aes_string(x = columns[i], y = "Freq", fill = columns[j])) +
      geom_bar(stat = "identity", position = "stack") +
      theme_minimal() +
      labs(title = paste("Relation entre", columns[i] , "et", columns[j]),
           x = columns[i],
           y = "Fréquence") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    #Affichage du graphique :
    print(graph)
  }
  
}

# ---------------------------------------------------------------------------------------------------------
# ---------------------------------------- HISTOGRAMMES REMPLIS : ----------------------------------------
# ---------------------------------------------------------------------------------------------------------

for (i in 1:(length(columns)-1)) {
  
  for (j in (i+1):length(columns)) {
    
    #Tableau croisé
    tableau <- table(data[[columns[i]]], data[[columns[j]]])
    
    #Convertion des valeurs
    tab <- as.data.frame(tableau)
    
    colnames(tab) <- c(columns[i], columns[j], "Freq")
    
    #Création du graphique
    graph <- ggplot(tab, aes_string(x = columns[i], y = "Freq", fill = columns[j])) +
      geom_bar(stat = "identity", position = "fill") +
      theme_minimal() +
      labs(title = paste("Relation entre", columns[i] , "et", columns[j]),
           x = columns[i],
           y = "Fréquence") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    #Affichage du graphique :
    print(graph)
  }
  
}
