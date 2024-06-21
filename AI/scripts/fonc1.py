import sys
import pickle
import json
import pandas as pd

# Initialisation de la liste des caractéristiques
val = []

for i in range(1, len(sys.argv) - 1):
    # Ajouter les features à la liste des caractéristiques
    val.append(float(sys.argv[i]))

# Récupération de la méthode de classification
methode = sys.argv[-1]

# Exécution du fichier correspondant à la méthode de classification
if methode == "kmeans":
    with open('../fonctionnalite_1/f1_kmeans_apprentissage.pkl', 'rb') as file:
        model = pickle.load(file)

    # Convertir les caractéristiques en DataFrame pandas
    data = pd.DataFrame([val])

    # Faire une prédiction
    prediction = model.predict(data)
    print(prediction)

    # Sauvegarder la prédiction dans un fichier JSON
    with open('fonc1.json', 'w') as mon_fichier:
        json.dump(int(prediction[0]), mon_fichier)
else:
    print("Erreur: méthode de classification non reconnue")
