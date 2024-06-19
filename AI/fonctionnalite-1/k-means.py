import sys
import pandas as pd
from sklearn.cluster import KMeans

from sklearn.metrics import silhouette_score
from sklearn.metrics import calinski_harabasz_score
from sklearn.metrics import davies_bouldin_score

data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])

print("-----------------------------------------------------")
print("Calcul de kmeans avec comme nombre de clusters : ", 2) #int(sys.argv[1])
print("-----------------------------------------------------")

n_clusters = 2 #int(sys.argv[1])

def calcul_kmeans(n):

    model = KMeans(n_clusters=n, random_state=42).fit(data_arbre)
    labels = model.predict(data_arbre)
    return labels

#Fonction calcul calcul kmeans :
print(calcul_kmeans(n_clusters))

print("-------------------------------------------------------")
print("Méthode pour calculer le score : Silhouette Coefficient")
print("-------------------------------------------------------")

def score_silhouette_coefficient(n):

    labels = calcul_kmeans(n_clusters)
    return silhouette_score(data_arbre, labels)

#Fonction calcul du score avec silhouette :
print(score_silhouette_coefficient(n_clusters))

print("--------------------------------------------------------")
print("Méthode pour calculer le score : Calinski-Harabasz Index")
print("--------------------------------------------------------")

def score_calinski_harabasz(n):

    labels = calcul_kmeans(n_clusters)
    return calinski_harabasz_score(data_arbre, labels)

#Fonction calcul du score avec calinski :
print(score_calinski_harabasz(n_clusters))

print("-----------------------------------------------------")
print("Méthode pour calculer le score : Davies-Bouldin Index")
print("-----------------------------------------------------")

def score_davies_bouldin(n):

    labels = calcul_kmeans(n_clusters)
    return davies_bouldin_score(data_arbre, labels)

#Fonction calcul du score avec davies kmeans :
print(score_davies_bouldin(n_clusters))