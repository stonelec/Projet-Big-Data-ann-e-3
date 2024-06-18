import sys
import pandas as pd
from sklearn.cluster import KMeans

data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])

def calcul_score_kmeans(n):
    model = KMeans(n_clusters=n, random_state=42).fit(data_arbre)
    score = model.labels_
    return score

if __name__ == "__main__":
    if len(sys.argv) > 1:
        n_clusters = int(sys.argv[1])
        print(calcul_score_kmeans(n_clusters))
    else:
        print("Veuillez fournir le nombre de clusters en argument.")
