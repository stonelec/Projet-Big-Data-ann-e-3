import sys
from ..fonctionnalite_2 import random_forest_classifier as rfc
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
    rfc.f1_random_forest()
else:
    print("Erreur: méthode de classification non reconnue")
    print("Veuillez choisir entre random_forest & ...")
