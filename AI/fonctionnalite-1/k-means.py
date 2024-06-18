import sys
import pandas as pd
from sklearn.cluster import KMeans

data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])

def calcul_kmeans(n):

    model = KMeans(n_clusters=n, random_state=42).fit(data_arbre)
    return model.labels_

print("-----------------------------------------------------")
print("Calcul de kmeans avec comme nombre de clusters : ", 2) #int(sys.argv[1])
print("-----------------------------------------------------")

#Fonction calcul calcul kmeans :
n_clusters = 2 #int(sys.argv[1])
print(calcul_kmeans(n_clusters))

print("-----------------------------------------------------")
print("Méthode pour calculer le score : ") #int(sys.argv[1])
print("-----------------------------------------------------")
