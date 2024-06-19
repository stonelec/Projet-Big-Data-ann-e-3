import sys


print("")
print("|=============================================================================|")
print("|         Apprentissage supervisé : Système d'alerte pour les tempêtes        |")
print("|.............................................................................|")
#print("|  - Features sélectionnés :                                                  |")
#for i in range(1,len(sys.argv)-1):
#print("|          *",sys.argv[i])
print("|  - méthode de classification :                                              |")
methode = sys.argv[len(sys.argv)-1]
print("|          *",methode)
print("|=============================================================================|")
print("")

#execution du fichier correspondant à la méthode de classification
if(methode == "random_forest"):
    import AI.fonctionnalite_3.random_forest_classifier as rfc
    rfc.random_forest_classifier()
else:
    print("Erreur: méthode de classification non reconnue")
    print("Veuillez choisir entre random_forest & ...")
