import sys
import pandas as pd
from sklearn.cluster import KMeans

# Chargement des données
data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])

# Récupération des arguments d'entrée :
haut_tronc = float(sys.argv[1])
age_estim = float(sys.argv[2])
tronc_diam = float(sys.argv[3])

# Nombre de clusters que l'on donne en entrée :
n_clusters = int(sys.argv[4])

kmeans_model = KMeans(n_clusters=n_clusters, random_state=42).fit(data_arbre)

data_arbre['cluster'] = kmeans_model.labels_

print("kModel : ", kmeans_model)

#On récupère les données et on les met de cette manière, car le data_arbre fait comme ça :
nouveau_data_arbre = pd.DataFrame([[haut_tronc, age_estim, tronc_diam]], columns=["haut_tronc", "age_estim", "tronc_diam"])
nouveau_data_arbre = nouveau_data_arbre[["haut_tronc", "tronc_diam", "age_estim"]]

print("Nouveau arbre", nouveau_data_arbre)

#On predict dans quel cluster va etre l'arbre
cluster_pred = kmeans_model.predict(nouveau_data_arbre)

print("Cluster : ", cluster_pred)

print(f"Le nouvel arbre appartient au cluster : {cluster_pred[0]}")
