# ---------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction du quartier ----------------------------------------
# ---------------------------------------------------------------------------------------------------------

# ----- Affichage des états en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_arb_etat, clc_quartier) %>%
  summarize(counts_function = n())

matrice_etat_quartier <- ggplot(counts_function, aes(x = fk_arb_etat, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") + 
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de l'intersection de fk_stadedev et clc_quartier") +
  xlab("fk_stadedev") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_stade_quartier

# ----- Affichage de l'apparence de l'abre en fonction des quartiers : ----- 

counts_function <- data %>%
  group_by(fk_port, clc_quartier) %>%
  summarize(counts_function = n())

matrice_port_quartier <- ggplot(counts_function, aes(x = fk_port, y = clc_quartier)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et clc_quartier") +
  xlab("feuillage") +
  ylab("Quartier") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_quartier

# -------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction de l'état ----------------------------------------
# -------------------------------------------------------------------------------------------------------

# ----- Affichage du stade de developpement en fonction de l'état : ----- 

counts_function <- data %>%
  group_by(fk_stadedev, fk_arb_etat) %>%
  summarize(counts_function = n())

matrice_stade_etat <- ggplot(counts_function, aes(x = fk_stadedev, y = fk_arb_etat)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_arb_etat") +
  xlab("feuillage") +
  ylab("fk_arb_etat") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_etat

# -----------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction du stade de developpement ----------------------------------------
# -----------------------------------------------------------------------------------------------------------------------

# ----- Affichage du stade du revetement en fonction du stade de developpement : ----- 

counts_function <- data %>%
  group_by(fk_revetement, fk_stadedev) %>%
  summarize(counts_function = n())

matrice_revetement_stade <- ggplot(counts_function, aes(x = fk_revetement, y = fk_stadedev)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_stadedev") +
  xlab("feuillage") +
  ylab("fk_stadedev") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_stade

# -----------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction du revetement ----------------------------------------
# -----------------------------------------------------------------------------------------------------------------------

# ----- Affichage de l'apparence en fonction du revetement : ----- 

counts_function <- data %>%
  group_by(fk_port, fk_revetement) %>%
  summarize(counts_function = n())

matrice_port_revetement <- ggplot(counts_function, aes(x = fk_port, y = fk_revetement)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_revetement") +
  xlab("feuillage") +
  ylab("fk_revetement") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_revetement

# -----------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction de l'apparence (port) ----------------------------------------
# -----------------------------------------------------------------------------------------------------------------------

# ----- Affichage du pied en fonction de l'apparence : ----- 

counts_function <- data %>%
  group_by(fk_pied, fk_port) %>%
  summarize(counts_function = n())

matrice_pied_port <- ggplot(counts_function, aes(x = fk_pied, y = fk_port)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_port") +
  xlab("feuillage") +
  ylab("fk_port") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_port

# -----------------------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction du pied ----------------------------------------
# -----------------------------------------------------------------------------------------------------------------------

# ----- Affichage de la situation en fonction du pied : ----- 

counts_function <- data %>%
  group_by(fk_situation, fk_pied) %>%
  summarize(counts_function = n())

matrice_situation_pied <- ggplot(counts_function, aes(x = fk_situation, y = fk_pied)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
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
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_pied") +
  xlab("feuillage") +
  ylab("fk_pied") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_pied

# --------------------------------------------------------------------------------------------------------------
# ---------------------------------------- En fonction de la situation  ----------------------------------------
# --------------------------------------------------------------------------------------------------------------

# ----- Affichage du feuillage en fonction de la situation : ----- 

counts_function <- data %>%
  group_by(feuillage, fk_situation) %>%
  summarize(counts_function = n())

matrice_feuillage_situation <- ggplot(counts_function, aes(x = feuillage, y = fk_situation)) +
  geom_tile(aes(fill = counts_function)) +
  geom_text(aes(label = counts_function), color = "black") +
  scale_fill_gradient(low = "white", high = "blue") +  # Dégradé de couleur pour les tuiles
  ggtitle("Nombre de valeurs en fonction de feuillage et fk_situation") +
  xlab("feuillage") +
  ylab("fk_situation") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#matrice_feuillage_situation

# --------------------------------------------------------------------------------------------------------------
# ---------------------------------------- Histogramme des variables  ------------------------------------------
# --------------------------------------------------------------------------------------------------------------

# ----- Histogramme des quartiers : ----- 

data$quartier_factor <- as.factor(data$clc_quartier)
data$quartier_numeric <- as.numeric(data$quartier_factor)

hist_quartier <- hist(data$quartier_numeric, 
                      breaks = seq(0.5, length(unique(data$quartier_numeric)) + 0.5, by = 1), 
                      freq = TRUE, 
                      col = "green", 
                      main = "Histogramme des Quartiers",
                      xlab = "",
                      ylab = "Fréquence des arbres", 
                      xaxt = "n")

axis(1, at = hist_quartier$mids, labels = levels(data$quartier_factor), las = 3)

#hist_quartier

#Pour afficher un quartier en particulier
#quartier_a <- "ROUVROY"
#data_quartier_a <- subset(data, clc_quartier == quartier_a)
#View(data_quartier_a)

# ----- Histogramme de l'etat : ----- 

data$etat_factor <- as.factor(data$fk_arb_etat)
data$etat_numeric <- as.numeric(data$etat_factor)

hist_etat <- hist(data$etat_numeric, 
                      breaks = seq(0.5, length(unique(data$etat_numeric)) + 0.5, by = 1), 
                      freq = TRUE, 
                      col = "green", 
                      main = "Histogramme des Etats",
                      xlab = "",
                      ylab = "Fréquence des arbres", 
                      xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$etat_factor), las = 3)

# ----- Histogramme des stades : ----- 

data$stade_factor <- as.factor(data$fk_stadedev)
data$stade_numeric <- as.numeric(data$stade_factor)

hist_etat <- hist(data$stade_numeric, 
                  breaks = seq(0.5, length(unique(data$stade_numeric)) + 0.5, by = 1), 
                  freq = TRUE, 
                  col = "green", 
                  main = "Histogramme des Stades",
                  xlab = "",
                  ylab = "Fréquence des arbres", 
                  xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$stade_factor), las = 3)


# ----- Histogramme de port : ----- 

data$port_factor <- as.factor(data$fk_port)
data$port_numeric <- as.numeric(data$port_factor)

hist_etat <- hist(data$port_numeric, 
                  breaks = seq(0.5, length(unique(data$port_numeric)) + 0.5, by = 1), 
                  freq = TRUE, 
                  col = "green", 
                  main = "Histogramme des Ports",
                  xlab = "",
                  ylab = "Fréquence des arbres", 
                  xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$port_factor), las = 3)

# ----- Histogramme des pieds : ----- 

data$pied_factor <- as.factor(data$fk_pied)
data$pied_numeric <- as.numeric(data$pied_factor)

hist_etat <- hist(data$pied_numeric, 
                  breaks = seq(0.5, length(unique(data$pied_numeric)) + 0.5, by = 1), 
                  freq = TRUE, 
                  col = "green", 
                  main = "Histogramme des Pieds",
                  xlab = "",
                  ylab = "Fréquence des arbres", 
                  xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$pied_factor), las = 3)

# ----- Histogramme des situations : ----- 

data$situation_factor <- as.factor(data$fk_situation)
data$situation_numeric <- as.numeric(data$situation_factor)

hist_etat <- hist(data$situation_numeric, 
                  breaks = seq(0.5, length(unique(data$situation_numeric)) + 0.5, by = 1), 
                  freq = TRUE, 
                  col = "green", 
                  main = "Histogramme des Situations",
                  xlab = "",
                  ylab = "Fréquence des arbres", 
                  xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$situation_factor), las = 3)

# ----- Histogramme des revetements : ----- 

data$revetement_factor <- as.factor(data$fk_revetement)
data$revetement_numeric <- as.numeric(data$revetement_factor)

hist_etat <- hist(data$revetement_numeric, 
                  breaks = seq(0.5, length(unique(data$revetement_numeric)) + 0.5, by = 1), 
                  freq = TRUE, 
                  col = "green", 
                  main = "Histogramme des Revetements",
                  xlab = "",
                  ylab = "Fréquence des arbres", 
                  xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$revetement_factor), las = 3)

# ----- Histogramme du feuillage : ----- 

data$feuillage_factor <- as.factor(data$feuillage)
data$feuillage_numeric <- as.numeric(data$feuillage_factor)

hist_etat <- hist(data$feuillage_numeric, 
                  breaks = seq(0.5, length(unique(data$feuillage_numeric)) + 0.5, by = 1), 
                  freq = TRUE, 
                  col = "green", 
                  main = "Histogramme des Feuillages",
                  xlab = "",
                  ylab = "Fréquence des arbres", 
                  xaxt = "n")

axis(1, at = hist_etat$mids, labels = levels(data$feuillage_factor), las = 3)

columns <- c("clc_quartier","haut_tot","haut_tronc","tronc_diam", "fk_arb_etat","fk_stadedev","fk_port","fk_pied",
             "fk_situation","fk_revetement", "age_estim", "feuillage","remarquable")

for (i in 1:(length(columns)-1)) {
  
  for (j in (i+1):length(columns)) {
    
    tableau <- table(data[[columns[i]]], data[[columns[j]]])
    
    tab <- as.data.frame(tableau)
    colnames(tab) <- c(columns[i], columns[j], "Freq")
    
    graph <- ggplot(tab, aes_string(x = columns[i], y = "Freq", fill = columns[j])) +
      geom_bar(stat = "identity", position = "dodge") +
      theme_minimal() +
      labs(title = paste("Relation entre", columns[i], "et", columns[j]),
           x = columns[i],
           y = "Fréquence") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    # Afficher le graphique
    print(graph)
    
  }

}

for (i in 1:(length(columns)-1)) {
  
  for (j in (i+1):length(columns)) {
    
    tableau <- table(data[[columns[i]]], data[[columns[j]]])
    
    tab <- as.data.frame(tableau)
    colnames(tab) <- c(columns[i], columns[j], "Freq")
    
    graph <- ggplot(tab, aes_string(x = columns[i], y = "Freq", fill = columns[j])) +
      geom_bar(stat = "identity", position = "dodge") +
      theme_minimal() +
      labs(title = paste("Relation entre", columns[i], "et", columns[j]),
           x = columns[i],
           y = "Fréquence") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    # Afficher le graphique
    print(graph)
    
  }
  
}



