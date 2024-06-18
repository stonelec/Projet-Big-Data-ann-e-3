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

tab_taille = pd.read_csv("Data_Arbre.csv")

haut_tronc = tab_taille['haut_tronc']

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
#Calculer la moyenne et la médianne :
#Après, définir chaque arbre (petit, grand) et (petit, moyen, grand)
#Appliquer le clustering 2 et 3, regarder les résultats
#Afficher en fonction de la position

# ---------------------------------------------------------------------------------
# ------------------------------ Moyenne et médianne ------------------------------
# ---------------------------------------------------------------------------------

"""
sum = 0
indice = 0

for i in range(len(haut_tronc)):

    sum += int(haut_tronc[i])
    indice += 1

print("Somme : ", sum)
print("Indice : ", indice)

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

"""import plotly.express as px

data = pd.read_csv("Data_Arbre.csv")

fig = px.scatter_mapbox(data,
                        lat="latitude",
                        lon="longitude",
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})
fig.show()


X = tab_taille['longitude']
Y = tab_taille['latitude']

plt.figure(figsize=(10, 10))

#Pour affichier en fonction des petits et grands arbres, attention long :
""""""
for i in range(len(haut_tronc)):

    if int(haut_tronc[i]) < moyenne:

        print("Petit : ", i)
        plt.scatter(X[i], Y[i], c="green")

    else:

        print("Grand : ", i)
        plt.scatter(X[i], Y[i], c="blue")
"""
"""

plt.scatter(X, Y)
plt.xlabel("$X$", fontsize=5)
plt.ylabel("$Y$", fontsize=5)
#plt.show()
"""

# -----------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé ------------------------------
# -----------------------------------------------------------------------------------------

# ---------- KMeans ----------

import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

#arbre = pd.read_csv("Data_Arbre.csv")

#haut_tronc = arbre["haut_tronc"]
#haut_tot = arbre["haut_tot"]

#model = KMeans(n_clusters=3).fit(arbre)

#print(model.labels_)

"""colormap = np.array(['Red', 'Blue', 'Yellow'])
plt.scatter(arbre["haut_tronc"], arbre["haut_tot"], c=colormap[model.labels_], s=40)
plt.show()

"""
# -----------------------------------------------------------------------
# ------------------------------ Métriques ------------------------------
# -----------------------------------------------------------------------

# ---------- KMeans ----------

from sklearn.metrics import silhouette_score

arbre = pd.read_csv("Data_Arbre.csv", usecols=["haut_tot"])

range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
silhouette_avg = []

var = 1

for num_clusters in range_n_clusters:

    var += 1

    print("Test : ", var)

    # initialise kmeans
    kmeans = KMeans(n_clusters=num_clusters, random_state=42)
    kmeans.fit(arbre)
    cluster_labels = kmeans.labels_

    # silhouette score
    silhouette_avg.append(silhouette_score(arbre, cluster_labels))

plt.plot(range_n_clusters, silhouette_avg)
plt.xlabel('Nombre de cluster')
plt.ylabel('Score')
plt.title('Silhouette Coefficient')
plt.show()
