# ----------------------------------------------------------------------------------------------
# ---------------------------------------- INDEPENDANCE ----------------------------------------
# ----------------------------------------------------------------------------------------------


columns <- c("clc_quartier","fk_arb_etat","fk_stadedev","fk_port","fk_pied",
             "fk_situation","fk_revetement", "feuillage","remarquable")


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
      
      #Méthode avec simulate.p.value :
      avec_simulate__chisq <- chisq.test(tableau_croise, simulate.p.value = TRUE)
      
      #Méthode sans simulate.p.value :
      sans_simulate__chisq <- chisq.test(tableau_croise)
      
      #Faire ces condtitions pour définir si la variable est indépendantes ou pas
      
      #Avec simulate : 
      if (avec_simulate__chisq$p.value >= 0.05){
        
        print(paste("Pour la méthode avec simulate, les valeurs sont indépendantes car ", avec_simulate__chisq$p.value ," est supérieur à 0.05"))
        
      }
      else{
        
        print(paste("Pour la méthode avec simulate, les valeurs sont dépendantes car ", avec_simulate__chisq$p.value ," est inférieure à 0.05"))
        
      }
      
      #Sans simulate :
      if (sans_simulate__chisq$p.value >= 0.05){
        
        print(paste("Pour la méthode sans simulate, les valeurs sont indépendantes car ", sans_simulate__chisq$p.value ," est supérieur à 0.05"))
        
      }
      else{
        
        print(paste("Pour la méthode sans simulate, les valeurs sont dépendantes car ", sans_simulate__chisq$p.value ," est inférieure à 0.05"))
        
      }
      
      # ----- Affichage des mosaïque : -----
      mosaic_title <- paste("Mosaic plot entre", columns[i], "et", columns[j])
      mosaicplot(tableau_croise, main = mosaic_title, shade = TRUE, legend = TRUE, las=2)
      
    }

  
}
