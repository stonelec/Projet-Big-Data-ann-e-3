# --------------------------------------------------------------------
# ------------------------------ Import ------------------------------
# --------------------------------------------------------------------

import pandas as pd
import numpy as np

import plotly.express as px
import matplotlib.pyplot as plt

from sklearn.cluster import KMeans
from sklearn.cluster import Birch
from sklearn.cluster import AgglomerativeClustering

# -------------------------------------------------------------------------------------
# ------------------------------ Préparation des données ------------------------------
# -------------------------------------------------------------------------------------

data_arbre = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim"])

#Pour l'affichage des clusters :
data_arbre_position = pd.read_csv("Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim"])

#Vérifier si tout est bien :

"""
var = 0

for i in range(len(haut_tronc)):
    var += 1
    print(haut_tronc[i])

#On a bien nos valeurs
#print(var)
"""

# ------------------------------------------------------------------------------
# ------------------------------ Afficher la data ------------------------------
# ------------------------------------------------------------------------------

#Regarder la taille des arbres en fonction de la fréquence des arbres

"""
haut_tot.hist(bins=50, figsize=(10, 10))
plt.show()
"""

# ---------------------------------------------------------------------------------
# ------------------------------ Moyenne et médianne ------------------------------
# ---------------------------------------------------------------------------------

"""
sum = 0
indice = 0

for i in range(len(haut_tronc)):

    sum += int(haut_tronc[i])
    indice += 1

moyenne = sum/indice

print("Moyenne ", moyenne)

petit = 0
grand = 0

position_petit = []
position_grand = []

for i in range(len(haut_tronc)):

    if(int(haut_tronc[i]) < moyenne):

        petit += 1

    else:

        grand += 1

#print("Nombre de petit arbre : ", petit)
#print("Nombre de grand arbre : ", grand)
"""

# ------------------------------------------------------------------------------------------------------------
# ------------------------------ Affichage de la carte avec les données de base ------------------------------
# ------------------------------------------------------------------------------------------------------------

"""fig = px.scatter_mapbox(position,
                        lat="latitude",
                        lon="longitude",
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})
fig.show()
"""

# --------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : Kmeans ------------------------------
# --------------------------------------------------------------------------------------------------

# ----- Kmeans -----

n_clusters = 3

kmeans_labels = KMeans(n_clusters=n_clusters, random_state=42).fit_predict(data_arbre)

# ----- Centroïdes : -----

centroides = KMeans(n_clusters=n_clusters, random_state=42).fit_predict(data_arbre)

# ----- Affichage des clusters sans la map : -----

"""
colormap = np.array(['Red', 'Blue', 'Yellow'])
plt.scatter(longitude, latitude, c=colormap[model], s=40)
plt.xlabel('Longitude (X)')
plt.ylabel('Latitude (Y)')
plt.title('3 Clusters en fonction de la position des arbres')

for i in range(n_clusters):
    plt.scatter([], [], c=colormap[i], label=f'Cluster {i+1}')

plt.legend()
plt.show()
"""

# ----- Affichage des clusters avec la map : -----

# On rajouter dans la data les clusters :

"""
data_arbre_position['cluster'] = kmeans_labels

fig = px.scatter_mapbox(data_arbre_position,
                        lat="latitude",
                        lon="longitude",
                        color="cluster",
                        color_discrete_sequence=["blue", "green", "red"],
                        hover_data=["haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim"],
                        zoom=12,
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

fig.show()
"""

# -------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : BIRCH ------------------------------
# -------------------------------------------------------------------------------------------------

# ----- BIRCH -----

birch_labels = Birch(n_clusters=n_clusters).fit_predict(data_arbre)

# ----- Affichage des clusters avec la map : -----

"""
data_arbre_position['cluster'] = birch_labels

fig = px.scatter_mapbox(data_arbre_position,
                        lat="latitude",
                        lon="longitude",
                        color="cluster",
                        color_discrete_sequence=["blue", "green", "red"],
                        hover_data=["haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim"],
                        zoom=12,
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

fig.show()
"""

# -------------------------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : AgglomerativeClustering ------------------------------
# -------------------------------------------------------------------------------------------------------------------

# ----- AgglomerativeClustering -----

agglomerative_clustering_labels = AgglomerativeClustering(n_clusters=n_clusters).fit_predict(data_arbre)

#  ----- Afficher sur la ville l'emplacement des arbres avec les clusters -----

"""
data_arbre_position['cluster'] = agglomerative_clustering_labels

fig = px.scatter_mapbox(data_arbre_position,
                        lat="latitude",
                        lon="longitude",
                        color="cluster",
                        color_discrete_sequence=["blue", "green", "red"],
                        hover_data=["haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim"],
                        zoom=12,
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

fig.show()
"""

# -----------------------------------------------------------------------
# ------------------------------ Métriques ------------------------------
# -----------------------------------------------------------------------

# ---------- Silhouette Coefficient ----------

"""from sklearn.metrics import silhouette_score

range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
silhouette_avg = []

var = 1

for num_clusters in range_n_clusters:

    var += 1

    print("Test : ", var)

    # initialise kmeans
    labels = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(data_arbre)

    # silhouette score
    silhouette_avg.append(silhouette_score(data_arbre, labels))

plt.plot(range_n_clusters, silhouette_avg)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Silhouette Coefficient')
plt.show()"""

# ---------- Calinski-Harabasz Index ----------

"""from sklearn.cluster import KMeans
from sklearn.metrics import calinski_harabasz_score

arbre = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])


#Les clusters qu'on va tester
range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

#On récupère le score ici et on le garde
score = []
res = 0

#Pour voir les tests(pas utile juste pour moi)
var = 1

for num_clusters in range_n_clusters:

    var += 1

    print("Test : ", var)

    # initialise kmeans
    labels = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(data_arbre)
    res = calinski_harabasz_score(arbre, labels)

    # score
    score.append(res)

plt.plot(range_n_clusters, score)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Calinski-Harabasz Index')
plt.show()"""

# ---------- Davies-Bouldin Index ----------

"""from sklearn.metrics import davies_bouldin_score
from sklearn.cluster import KMeans

arbre = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])


range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

score = []
var = 0

for num_clusters in range_n_clusters:

    var += 1

    print("Test : ", var)

    # initialise kmeans
    labels = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(data_arbre)
    res = davies_bouldin_score(arbre, labels)

    # score
    score.append(res)

plt.plot(range_n_clusters, score)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Davies-Bouldin Index')
plt.show()"""