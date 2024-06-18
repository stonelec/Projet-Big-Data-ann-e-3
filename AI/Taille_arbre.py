# --------------------------------------------------------------------
# ------------------------------ Import ------------------------------
# --------------------------------------------------------------------

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.datasets import make_blobs


# -------------------------------------------------------------------------------------
# ------------------------------ Préparation des données ------------------------------
# -------------------------------------------------------------------------------------

data_arbre = pd.read_csv("Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam", "fk_prec_estim" ])

position = pd.read_csv("Data_Arbre.csv", usecols=["longitude", "latitude"])
longitude = pd.read_csv("Data_Arbre.csv", usecols=["longitude"])
latitude = pd.read_csv("Data_Arbre.csv", usecols=["latitude"])

haut_tot = pd.read_csv("Data_Arbre.csv", usecols=["haut_tot"])
haut_tronc = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc"])

diametre = pd.read_csv("Data_Arbre.csv", usecols=["tronc_diam"])

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
# ------------------------------ Liste des tâches ------------------------------
# ------------------------------------------------------------------------------

#Récupérer la taille de chaque arbre : fait
#Appliquer le clustering 2 et 3, regarder les résultats : fait
#Afficher en fonction de la position : en cours

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

# -----------------------------------------------------------------------------------
# ------------------------------ Affichage de la carte ------------------------------
# -----------------------------------------------------------------------------------

# ----- Afficher sur la ville l'emplacement des arbres -----

import plotly.express as px

"""fig = px.scatter_mapbox(position,
                        lat="latitude",
                        lon="longitude",
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})
fig.show()
"""

# -----------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé ------------------------------
# -----------------------------------------------------------------------------------------

# ---------- KMeans ----------

"""import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

model = KMeans(n_clusters=3, random_state=42).fit_predict(data_arbre)

print(model.labels_)

#Affichage en fonction de la position

colormap = np.array(['Red', 'Blue', 'Yellow'])
plt.scatter(longitude, latitude, c=colormap[model.labels_], s=40)
plt.xlabel('Longitude (X)')
plt.ylabel('Latitude (Y)')
plt.title('3 Clusters en fonction de la position des arbres')

plt.scatter([], [], c=colormap[0], label=f'Cluster 1')
plt.scatter([], [], c=colormap[1], label=f'Cluster 2')
plt.scatter([], [], c=colormap[2], label=f'Cluster 3')

plt.legend()
plt.show()
"""

# ----- Afficher sur la ville l'emplacement des arbres avec les clusters -----

"""import plotly.express as px
from sklearn.cluster import KMeans

# Effectuer le clustering
model = KMeans(n_clusters=3, random_state=42).fit(data_arbre)
data_arbre['cluster'] = model.labels_

# Tracer la carte avec Plotly Express
fig = px.scatter_mapbox(data_arbre,
                        lat="latitude",
                        lon="longitude",
                        color="cluster",  # Colorer par cluster
                        zoom=10,  # Ajuster le niveau de zoom initial
                        height=700,
                        width=700)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

fig.show()"""

# -----------------------------------------------------------------------
# ------------------------------ Métriques ------------------------------
# -----------------------------------------------------------------------

# ---------- Silhouette Coefficient ----------

"""
from sklearn.metrics import silhouette_score

range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
silhouette_avg = []

var = 1

for num_clusters in range_n_clusters:

    var += 1

    print("Test : ", var)

    # initialise kmeans
    kmeans = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(arbre)
    cluster_labels = kmeans.labels_

    # silhouette score
    silhouette_avg.append(silhouette_score(arbre, cluster_labels))

plt.plot(range_n_clusters, silhouette_avg)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Silhouette Coefficient')
plt.show()"""

# ---------- Calinski-Harabasz Index ----------

"""

from sklearn.cluster import KMeans
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
    kmeans = KMeans(n_clusters=num_clusters, random_state=42).fit(arbre)
    res = calinski_harabasz_score(arbre, kmeans.labels_)

    # score
    score.append(res)

plt.plot(range_n_clusters, score)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Calinski-Harabasz Index')
plt.show()
"""

# ---------- Davies-Bouldin Index ----------

"""
from sklearn.metrics import davies_bouldin_score
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
    kmeans = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(arbre)
    res = davies_bouldin_score(arbre, kmeans)

    # score
    score.append(res)

plt.plot(range_n_clusters, score)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Davies-Bouldin Index')
plt.show()
"""