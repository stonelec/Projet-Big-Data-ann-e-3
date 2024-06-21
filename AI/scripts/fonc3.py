import sys
import pickle
import pandas as pd
print("")
print("|=============================================================================|")
print("|         Apprentissage supervisé : Système d'alerte pour les tempêtes        |")
print("|.............................................................................|")
print("|  - Features sélectionnés :                                                  |")
caracteristiques = []
for i in range(1,len(sys.argv)-1):
    print("|          *",sys.argv[i])
    #ajouter les features à la liste des caractéristiques
    caracteristiques.append(float(sys.argv[i]))
print("|  - méthode de classification :                                              |")
methode = sys.argv[len(sys.argv)-1]
print("|          *",methode)
print("|=============================================================================|")
print("")

#nouveau_data_arbre = pd.DataFrame([caracteristiques], columns=['haut_tot', 'haut_tronc', 'tronc_diam'])
#nouveau_data_arbre = nouveau_data_arbre[['haut_tot', 'haut_tronc', 'tronc_diam']]


#execution du fichier correspondant à la méthode de classification
if(methode == "random_forest" or True):
    print("Execution du fichier random_forest")
    with open('../fonctionnalite_3/f3_random_forest.pkl', 'rb') as file:
        model = pickle.load(file)
        print("Prédiction : ", model.predict([caracteristiques]))

elif(methode == "multilayer_perceptron"):
    print("Execution du fichier knn")
    with open('../fonctionnalite_3/f3_multilayer_perceptron.pkl', 'rb') as file:
        model = pickle.load(file)
        print("Prédiction : ", model.predict([caracteristiques]))

elif(methode == "k-nearest_neighbors"):
    print("Execution du fichier svm")
    with open('../fonctionnalite_3/f3_k_nearest_neighbors.pkl', 'rb') as file:
        model = pickle.load(file)
        print("Prédiction : ", model.predict([caracteristiques]))

else:
    print("Erreur: méthode de classification non reconnue")
