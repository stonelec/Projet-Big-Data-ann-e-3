import sys
import pandas as pd
from sklearn.cluster import KMeans

# Chargement des données
data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])

# Récupération des arguments d'entrée
haut_tronc = float(sys.argv[1])
age_estim = float(sys.argv[2])
tronc_diam = float(sys.argv[3])

# Nombre de clusters (peut être modifié pour prendre en compte un argument en entrée)
n_clusters = 3

def kmeans_apprentissage(data, n_clusters):
    kmeans = KMeans(n_clusters=n_clusters, random_state=42)
    kmeans.fit(data)
    return kmeans

# Apprentissage du modèle KMeans
kmeans_model = kmeans_apprentissage(data_arbre, n_clusters)

# Ajout des étiquettes de cluster aux données d'origine
data_arbre['cluster'] = kmeans_model.labels_

# Création d'un nouveau DataFrame pour le nouvel arbre
new_tree = pd.DataFrame([[haut_tronc, age_estim, tronc_diam]], columns=["haut_tronc", "age_estim", "tronc_diam"])

# Prédiction du cluster pour le nouvel arbre
new_tree_cluster = kmeans_model.predict(new_tree)

# Affichage du cluster du nouvel arbre
print(f"Le nouvel arbre appartient au cluster : {new_tree_cluster[0]}")