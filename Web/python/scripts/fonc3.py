import sys
import pickle
import json
caracteristiques = []
for i in range(1,len(sys.argv)-1):
    #ajouter les features à la liste des caractéristiques
    caracteristiques.append(float(sys.argv[i]))
methode = sys.argv[len(sys.argv)-1]



#execution du fichier correspondant à la méthode de classification
if(methode == "rf" or True):
    with open('../fonctionnalite_3/f3_random_forest.pkl', 'rb') as file:
        model = pickle.load(file)
    prediction = model.predict([caracteristiques])
    print(prediction)
    with open('fonc3.json', 'w') as mon_fichier:
        json.dump(int(prediction[0]), mon_fichier)

elif(methode == "mlp"):
    with open('../fonctionnalite_3/f3_multilayer_perceptron.pkl', 'rb') as file:
        model = pickle.load(file)
    prediction = model.predict([caracteristiques])
    print("Prédiction : ", prediction)
    with open('fonc3.json', 'w') as mon_fichier:
        json.dump(prediction, mon_fichier)

elif(methode == "knn"):
    with open('../fonctionnalite_3/f3_k_nearest_neighbors.pkl', 'rb') as file:
        model = pickle.load(file)
    prediction = model.predict([caracteristiques])
    print("Prédiction : ", prediction)
    with open('fonc3.json', 'w') as mon_fichier:
        json.dump(prediction, mon_fichier)

else:
    print("Erreur: méthode de classification non reconnue")
