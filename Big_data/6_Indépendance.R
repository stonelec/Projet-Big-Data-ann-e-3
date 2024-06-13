#-----------------------------------------------------------------------------------------------------
#                                   Indépendants ou non
#-----------------------------------------------------------------------------------------------------

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
      
      #print(paste("Sans simulation : ", sans_simulate__chisq$residuals, "Avec simulation : ", avec_simulate__chisq$residuals))
      
      if (avec_simulate__chisq$p.value >= 0.05){
        
        print(paste("Pour la méthode sans simulate, les valeurs sont indépendantes car ", avec_simulate__chisq$p.value ," est supérieur à 0.05"))
        
      }
      else{
        
        print(paste("Pour la méthode sans simulate, les valeurs sont dépendantes car ", avec_simulate__chisq$p.value ," est inférieure à 0.05"))
        
      }
      if (sans_simulate__chisq$p.value >= 0.05){
        
        print(paste("Pour la méthode sans simulate, les valeurs sont indépendantes car ", sans_simulate__chisq$p.value ," est supérieur à 0.05"))
        
      }
      else{
        
        print(paste("Pour la méthode sans simulate, les valeurs sont dépendantes car ", sans_simulate__chisq$p.value ," est inférieure à 0.05"))
        
      }
      
      mosaic_title <- paste("Mosaic plot entre", columns[i], "et", columns[j])
      mosaicplot(tableau_croise, main = mosaic_title, shade = TRUE, legend = TRUE, las=2)
      
    }

  
}

