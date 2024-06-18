import sys
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score

data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])

print("-----------------------------------------------------")
print("Calcul de kmeans avec comme nombre de clusters : ", 2) #int(sys.argv[1])
print("-----------------------------------------------------")

def calcul_kmeans(n):

    model = KMeans(n_clusters=n, random_state=42).fit(data_arbre)
    return model.labels_

#Fonction calcul calcul kmeans :
n_clusters = 2 #int(sys.argv[1])
print(calcul_kmeans(n_clusters))

print("-------------------------------------------------------")
print("Méthode pour calculer le score : Silhouette Coefficient")
print("-------------------------------------------------------")

def score_silhouette_coefficient(n):

    kmeans = KMeans(n_clusters=n, random_state=42).fit(data_arbre)
    return silhouette_score(data_arbre, kmeans.labels_)

#Fonction calcul calcul kmeans :
n_clusters = 2 #int(sys.argv[1])
print(score_silhouette_coefficient(n_clusters))

print("--------------------------------------------------------")
print("Méthode pour calculer le score : Calinski-Harabasz Index")
print("--------------------------------------------------------")

from sklearn.metrics import calinski_harabasz_score

def score_calinski_harabasz(n):

    kmeans = KMeans(n_clusters=n, random_state=42).fit(data_arbre)
    return calinski_harabasz_score(data_arbre, kmeans.labels_)

#Fonction calcul calcul kmeans :
n_clusters = 2 #int(sys.argv[1])
print(score_calinski_harabasz(n_clusters))

print("-----------------------------------------------------")
print("Méthode pour calculer le score : Davies-Bouldin Index")
print("-----------------------------------------------------")

from sklearn.metrics import davies_bouldin_score

def score_davies_bouldin(n):

    kmeans = KMeans(n_clusters=n, random_state=42).fit_predict(data_arbre)
    return davies_bouldin_score(data_arbre, kmeans)

#Fonction calcul calcul kmeans :
n_clusters = 2 #int(sys.argv[1])
print(score_davies_bouldin(n_clusters))