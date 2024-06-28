import sys
import pickle
import json
import pandas as pd

caracteristiques = []
for i in range(1, len(sys.argv)-1):
    #ajouter les features à la liste des caractéristiques
    caracteristiques.append(float(sys.argv[i]))

methode = sys.argv[len(sys.argv)-1]

#execution du fichier correspondant à la méthode de classification
if methode == "rf":
    with open('../fonctionnalite_2/f2_random_forest.pkl', 'rb') as file:
        model = pickle.load(file)

    data = pd.DataFrame([caracteristiques])
    prediction = model.predict(data)
    print("Prédiction : ", prediction)
    with open('fonc2.json', 'w') as mon_fichier:
        json.dump(int(prediction), mon_fichier)

elif methode == "mlp":
    with open('../fonctionnalite_2/f2_mutli_layer_perceptron.pkl', 'rb') as file:
        model = pickle.load(file)
    data = pd.DataFrame([caracteristiques])
    prediction = model.predict(data)
    print("Prédiction : ", prediction)
    with open('fonc2.json', 'w') as mon_fichier:
        json.dump(int(prediction), mon_fichier)

elif methode == "knn":
    with open('../fonctionnalite_2/f2_k_nearest_neighbors.pkl', 'rb') as file:
        model = pickle.load(file)
    data = pd.DataFrame([caracteristiques])
    prediction = model.predict(data)
    print("Prédiction : ", prediction)
    with open('fonc2.json', 'w') as mon_fichier:
        json.dump(int(prediction), mon_fichier)

else:
    print("Erreur: méthode de classification non reconnue")
