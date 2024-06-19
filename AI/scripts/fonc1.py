import sys
print("")
print("|=============================================================================|")
print("|         Apprentissage supervisé : Système d'alerte pour les tempêtes        |")
print("|.............................................................................|")
print("|  - Features sélectionnés :                                                  |")
for i in range(1,len(sys.argv)-1):
    print("|          *",sys.argv[i])
print("|  - méthode de classification :                                              |")
print("|          *",sys.argv[len(sys.argv)-1])
print("|=============================================================================|")