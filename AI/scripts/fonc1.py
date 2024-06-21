import sys
import pickle
import json
caracteristiques = []
for i in range(1, len(sys.argv)-1):
    #ajouter les features à la liste des caractéristiques
    caracteristiques.append(float(sys.argv[i]))
methode = sys.argv[len(sys.argv)-1]

#execution du fichier correspondant à la méthode de classification
if(methode == "kmeans"):
    with open('../fonctionnalite_1/f1_kmeans_apprentissage.pkl', 'rb') as file:
        model = pickle.load(file)
    prediction = model.predict([caracteristiques])
    print(prediction)
    with open('fonc3.json', 'w') as mon_fichier:
        json.dump(int(prediction), mon_fichier)

else:
    print("Erreur: méthode de classification non reconnue")
