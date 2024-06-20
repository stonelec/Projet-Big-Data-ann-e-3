# --------------------------------------------------------------------
# ------------------------------ Import ------------------------------
# --------------------------------------------------------------------

import pandas as pd
import numpy as np
import time
from sklearn.preprocessing import LabelEncoder

#Affichage :
import plotly.express as px
import matplotlib.pyplot as plt

#Méthodes
from sklearn.cluster import KMeans
from sklearn.cluster import Birch
from sklearn.cluster import AgglomerativeClustering

#Métriques :
from sklearn.metrics import silhouette_score
from sklearn.metrics import calinski_harabasz_score
from sklearn.metrics import davies_bouldin_score

# -------------------------------------------------------------------------------------
# ------------------------------ Préparation des données ------------------------------
# -------------------------------------------------------------------------------------

"""data = pd.read_csv("Data_Arbre.csv",
                         usecols=["haut_tronc", "age_estim", "tronc_diam",
                                  "fk_stadedev", "fk_port",
                                  "fk_pied", "fk_revetement", "feuillage",
                                  "remarquable"])

# Créer un encodeur :
label_encoder = LabelEncoder()

# Appliquer l'encodage :
data['fk_stadedev_encoded'] = label_encoder.fit_transform(data['fk_stadedev'])
data['fk_port_encoded'] = label_encoder.fit_transform(data['fk_port'])
data['fk_pied_encoded'] = label_encoder.fit_transform(data['fk_pied'])
data['fk_revetement_encoded'] = label_encoder.fit_transform(data['fk_revetement'])
data['feuillage_encoded'] = label_encoder.fit_transform(data['feuillage'])
data['remarquable_encoded'] = label_encoder.fit_transform(data['remarquable'])

data_arbre = data[["haut_tronc", "age_estim", "tronc_diam",
                   "fk_stadedev_encoded",
                   "fk_port_encoded", "fk_pied_encoded",
                   "fk_revetement_encoded", "feuillage_encoded",
                   "remarquable_encoded"]]"""

data_arbre = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])

data_arbre_position_notre_data = pd.read_csv("AI_Patrimoine_Arboré_(RO).csv", usecols=["X", "Y", "haut_tronc", "age_estim", "tronc_diam"])
data_arbre_position_data_prof = pd.read_csv("Data_Arbre.csv", usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam"])

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

# --------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : Kmeans ------------------------------
# --------------------------------------------------------------------------------------------------
def kmeans_apprentissage(data_arbre, n_clusters):

    kmeans_labels = KMeans(n_clusters=n_clusters, random_state=42).fit_predict(data_arbre)
    return kmeans_labels

def centroides_kmeans(data_arbre, n_clusters):

    centroides = KMeans(n_clusters=n_clusters, random_state=42).fit_predict(data_arbre)
    return centroides

# -------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : BIRCH ------------------------------
# -------------------------------------------------------------------------------------------------
def birch_apprentissage(data_arbre, n_clusters):

    birch_labels = Birch(n_clusters=n_clusters).fit_predict(data_arbre)
    return birch_labels

# -------------------------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : AgglomerativeClustering ------------------------------
# -------------------------------------------------------------------------------------------------------------------
def agglomerative_clustering_apprentissage(data_arbre, n_clusters):

    agglomerative_clustering_labels = AgglomerativeClustering(n_clusters=n_clusters).fit_predict(data_arbre)
    return agglomerative_clustering_labels

# -----------------------------------------------------------------------
# ------------------------------ Affichage ------------------------------
# -----------------------------------------------------------------------

# ----- Affichage de la carte avec les données de base -----

"""fig = px.scatter_mapbox(position,
                        lat="latitude",
                        lon="longitude",
                        height=800,
                        width=800)

fig.update_layout(mapbox_style="open-street-map")
fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})
fig.show()
"""

# ----- Affichage des clusters sans la map : -----

"""
def affichage_sans_map_notre_data(data_arbre, n_clusters):

    longitude = data_arbre['longitude']
    latitude = data_arbre['latitude']

    model = kmeans_apprentissage(data_arbre, n_clusters)

    colormap = np.array(['Red', 'Blue', 'Yellow'])
    plt.scatter(longitude, latitude, c=colormap[model], s=40)
    plt.xlabel('Longitude (X)')
    plt.ylabel('Latitude (Y)')
    plt.title('3 Clusters en fonction de la position des arbres')

    for i in range(n_clusters):
        plt.scatter([], [], c=colormap[i], label=f'Cluster {i+1}')

    plt.legend()
    plt.show()"""

# ----- Affichage des clusters avec la map : -----

def affichage_notre_data(data_arbre, n_clusters):

    #On récupère les clusters :
    model = kmeans_apprentissage(data_arbre, n_clusters)

    #On rajoute une colonne avec les clusters
    data_arbre_position_notre_data['cluster'] = model

    fig = px.scatter_mapbox(data_arbre_position_notre_data,
                            lat="X",
                            lon="Y",
                            color="cluster",
                            color_discrete_sequence=["blue", "green", "red"],
                            hover_data=["haut_tronc", "age_estim", "tronc_diam"],
                            zoom=12,
                            height=800,
                            width=800)

    fig.update_layout(mapbox_style="open-street-map")
    fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

    fig.show()
def affichage_data_prof(n_clusters):

    #On récupère les clusters :
    model = kmeans_apprentissage(data_arbre_position_data_prof, n_clusters)

    #On rajoute une colonne avec les clusters
    data_arbre_position_data_prof['cluster'] = model

    fig = px.scatter_mapbox(data_arbre_position_notre_data,
                            lat="latitude",
                            lon="longitude",
                            color="cluster",
                            color_discrete_sequence=["blue", "green", "red"],
                            hover_data=["haut_tronc", "age_estim", "tronc_diam"],
                            zoom=12,
                            height=800,
                            width=800)

    fig.update_layout(mapbox_style="open-street-map")
    fig.update_layout(margin={"r":0,"t":0,"l":0,"b":0})

    fig.show()

affichage_data_prof(3)

# -----------------------------------------------------------------------
# ------------------------------ Métriques ------------------------------
# -----------------------------------------------------------------------

# ---------- Silhouette Coefficient ----------
def sil_score(data_arbre, model_apprentissage):

    return silhouette_score(data_arbre, model_apprentissage)
def affichage_graphique_silhouette(data_arbre):

    range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                        21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    score = []

    for num_clusters in range_n_clusters:

        labels = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(data_arbre)
        score.append(silhouette_score(data_arbre, labels))

    mean_silhouette_score = np.mean(score)
    print(f'Moyenne des valeurs du score du silhouette : {mean_silhouette_score}')
    print("")

    plt.plot(range_n_clusters, score)
    plt.axhline(y=mean_silhouette_score, color='r', linestyle='--', label=f'Moyenne = {mean_silhouette_score:.2f}')
    plt.xlabel('Nombre de clusters')
    plt.ylabel('Score')
    plt.title('Silhouette Coefficient')
    plt.show()

# ---------- Calinski-Harabasz Index ----------
def calinski_score(data_arbre, model_apprentissage):

    return calinski_harabasz_score(data_arbre, model_apprentissage)
def affichage_graphique_calinksi(data_arbre):

    range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                        21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

    #On récupère le score ici et on le garde
    score = []

    for num_clusters in range_n_clusters:

        # initialise kmeans
        labels = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(data_arbre)
        score.append(calinski_harabasz_score(data_arbre, labels))

    mean_calinski_score = np.mean(score)
    print(f'Moyenne des valeurs du score de calinski : {mean_calinski_score}')
    print("")

    plt.plot(range_n_clusters, score)
    plt.axhline(y=mean_calinski_score, color='r', linestyle='--', label=f'Moyenne = {mean_calinski_score:.2f}')
    plt.xlabel('Nombre de clusters')
    plt.ylabel('Score')
    plt.title('Calinski-Harabasz Index')
    plt.show()

# ---------- Davies-Bouldin Index ----------
def davies_score(data_arbre, model_apprentissage):

    return davies_bouldin_score(data_arbre, model_apprentissage)
def affichage_graphique_davies(data_arbre):

    range_n_clusters = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                        21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

    score = []

    for num_clusters in range_n_clusters:

        # initialise kmeans
        labels = KMeans(n_clusters=num_clusters, random_state=42).fit_predict(data_arbre)
        score.append(davies_bouldin_score(data_arbre, labels))

    mean_davies_score = np.mean(score)
    print(f'Moyenne des valeurs du score de davies : {mean_davies_score}')
    print("")

    plt.plot(range_n_clusters, score)
    plt.axhline(y=mean_davies_score, color='r', linestyle='--', label=f'Moyenne = {mean_davies_score:.2f}')
    plt.xlabel('Nombre de clusters')
    plt.ylabel('Score')
    plt.title('Davies-Bouldin Index')
    plt.show()

# ------------------------------------------------------------------
# ------------------------------ Menu ------------------------------
# ------------------------------------------------------------------

'''
print("-------------------")
print("Fonctionnalité 1 : ")
print("-------------------")
print("")

print("Choisir la data : ")
print("La notre : 0")
print("Celle qui nous a été founit : 1")
print("")

choix_data = int(input("Votre choix : "))

while choix_data != 0 and choix_data != 1:

    print("Erreur, veuillez entrer la valeur 0 ou 1 pour choisir le type de data que vous souhaitez : ")
    choix_data = int(input("Votre choix : "))

time.sleep(2)
print("")

match choix_data:

    #Notre data
    case 0:

        data_arbre = pd.read_csv("AI_Patrimoine_Arboré_(RO).csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])
        print("Vous avez choisi notre data")

        print("")
        print("--------------------------------------------------------------------------")
        print("")

        print("Avec quelle type d'apprentissage non supervisé : ")
        print("Kmeans : 0")
        print("Birch : 1")
        print("AgglomerativeClustering : 2")

        choix_apprentissage = int(input("Votre choix : "))

        while choix_apprentissage != 0 and choix_apprentissage != 1 and choix_apprentissage != 2:
            print("Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir l'apprentissage que vous souhaitez : ")
            choix_apprentissage = int(input("Votre choix : "))

        time.sleep(2)
        print("")

        match choix_apprentissage:

            #KMeans
            case 0:

                methode = "Kmeans"

                print("Vous avez choisi", methode)
                print("")
                print("--------------------------------------------------------------------------")
                print("")

                print("Avec quelle métrique voulez vous touver le score : ")
                print("Silhouette Coefficient : 0")
                print("Calinski-Harabasz Index : 1")
                print("Davies-Bouldin Index : 2")

                choix_metrique = int(input("Votre choix : "))

                while choix_metrique != 0 and choix_metrique != 1 and choix_metrique != 2:
                    print(
                        "Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir la métrique que vous souhaitez : ")
                    choix_metrique = int(input("Votre choix : "))

                time.sleep(2)
                print("")

                match choix_metrique:

                    #Silhouette Coefficient
                    case 0:

                        metrique = "Silhouette Coefficient"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            #2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode", methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                            #3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                    #Calinski-Harabasz Index
                    case 1:

                        metrique = "Calinski-Harabasz Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode", methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)


                    #Davies-Bouldin Index
                    case 2:

                        metrique = "Davies-Bouldin Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

            #Birch
            case 1:

                methode = "Birch"

                print("Vous avez choisi", methode)
                print("")
                print("--------------------------------------------------------------------------")
                print("")

                print("Avec quelle métrique voulez vous touver le score : ")
                print("Silhouette Coefficient : 0")
                print("Calinski-Harabasz Index : 1")
                print("Davies-Bouldin Index : 2")

                choix_metrique = int(input("Votre choix : "))

                while choix_metrique != 0 and choix_metrique != 1 and choix_metrique != 2:
                    print(
                        "Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir la métrique que vous souhaitez : ")
                    choix_metrique = int(input("Votre choix : "))

                time.sleep(2)
                print("")

                match choix_metrique:

                    # Silhouette Coefficient
                    case 0:

                        metrique = "Silhouette Coefficient"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, " clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique ", metrique, " est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                    # Calinski-Harabasz Index
                    case 1:

                        metrique = "Calinski-Harabasz Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                    # Davies-Bouldin Index
                    case 2:

                        metrique = "Davies-Bouldin Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

            #AgglomerativeClustering
            case 2:

                methode = "AgglomerativeClustering"

                print("Vous avez choisi", methode)
                print("")
                print("--------------------------------------------------------------------------")
                print("")

                print("Avec quelle métrique voulez vous touver le score : ")
                print("Silhouette Coefficient : 0")
                print("Calinski-Harabasz Index : 1")
                print("Davies-Bouldin Index : 2")

                choix_metrique = int(input("Votre choix : "))

                while choix_metrique != 0 and choix_metrique != 1 and choix_metrique != 2:
                    print(
                        "Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir la métrique que vous souhaitez : ")
                    choix_metrique = int(input("Votre choix : "))

                time.sleep(2)
                print("")

                match choix_metrique:

                    # Silhouette Coefficient
                    case 0:

                        metrique = "Silhouette Coefficient"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                    # Calinski-Harabasz Index
                    case 1:

                        metrique = "Calinski-Harabasz Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                    # Davies-Bouldin Index
                    case 2:

                        metrique = "Davies-Bouldin Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

    #Data prof
    case 1:

        data_arbre = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])
        print("Vous avez choisi la data qui nous a été fournit")

        print("")
        print("--------------------------------------------------------------------------")
        print("")

        print("Avec quelle type d'apprentissage non supervisé : ")
        print("Kmeans : 0")
        print("Birch : 1")
        print("AgglomerativeClustering : 2")

        choix_apprentissage = int(input("Votre choix : "))

        while choix_apprentissage != 0 and choix_apprentissage != 1 and choix_apprentissage != 2:
            print("Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir l'apprentissage que vous souhaitez : ")
            choix_apprentissage = int(input("Votre choix : "))

        time.sleep(2)
        print("")

        match choix_apprentissage:

            # KMeans
            case 0:

                methode = "Kmeans"

                print("Vous avez choisi", methode)
                print("")
                print("--------------------------------------------------------------------------")
                print("")

                print("Avec quelle métrique voulez vous touver le score : ")
                print("Silhouette Coefficient : 0")
                print("Calinski-Harabasz Index : 1")
                print("Davies-Bouldin Index : 2")

                choix_metrique = int(input("Votre choix : "))

                while choix_metrique != 0 and choix_metrique != 1 and choix_metrique != 2:
                    print(
                        "Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir la métrique que vous souhaitez : ")
                    choix_metrique = int(input("Votre choix : "))

                time.sleep(2)
                print("")

                match choix_metrique:

                    # Silhouette Coefficient
                    case 0:

                        metrique = "Silhouette Coefficient"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode", methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                    # Calinski-Harabasz Index
                    case 1:

                        metrique = "Calinski-Harabasz Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode", methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                    # Davies-Bouldin Index
                    case 2:

                        metrique = "Davies-Bouldin Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

            # Birch
            case 1:

                methode = "Birch"

                print("Vous avez choisi", methode)
                print("")
                print("--------------------------------------------------------------------------")
                print("")

                print("Avec quelle métrique voulez vous touver le score : ")
                print("Silhouette Coefficient : 0")
                print("Calinski-Harabasz Index : 1")
                print("Davies-Bouldin Index : 2")

                choix_metrique = int(input("Votre choix : "))

                while choix_metrique != 0 and choix_metrique != 1 and choix_metrique != 2:
                    print(
                        "Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir la métrique que vous souhaitez : ")
                    choix_metrique = int(input("Votre choix : "))

                time.sleep(2)
                print("")

                match choix_metrique:

                    # Silhouette Coefficient
                    case 0:

                        metrique = "Silhouette Coefficient"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, " clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique ", metrique, " est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                    # Calinski-Harabasz Index
                    case 1:

                        metrique = "Calinski-Harabasz Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                    # Davies-Bouldin Index
                    case 2:

                        metrique = "Davies-Bouldin Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

            # AgglomerativeClustering
            case 2:

                methode = "AgglomerativeClustering"

                print("Vous avez choisi", methode)
                print("")
                print("--------------------------------------------------------------------------")
                print("")

                print("Avec quelle métrique voulez vous touver le score : ")
                print("Silhouette Coefficient : 0")
                print("Calinski-Harabasz Index : 1")
                print("Davies-Bouldin Index : 2")

                choix_metrique = int(input("Votre choix : "))

                while choix_metrique != 0 and choix_metrique != 1 and choix_metrique != 2:
                    print(
                        "Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir la métrique que vous souhaitez : ")
                    choix_metrique = int(input("Votre choix : "))

                time.sleep(2)
                print("")

                match choix_metrique:

                    # Silhouette Coefficient
                    case 0:

                        metrique = "Silhouette Coefficient"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = sil_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : /!\\ Le temps peut être long /!\\")
                                affichage_graphique_silhouette(data_arbre)

                    # Calinski-Harabasz Index
                    case 1:

                        metrique = "Calinski-Harabasz Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = calinski_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_calinksi(data_arbre)

                    # Davies-Bouldin Index
                    case 2:

                        metrique = "Davies-Bouldin Index"

                        print("Vous avez choisi la metrique :", metrique)
                        print("")
                        print("--------------------------------------------------------------------------")
                        print("")

                        print("Nombre de cluster : ")
                        print("2 clusters : 0")
                        print("3 clusters : 1")

                        choix_cluster = int(input("Votre choix : "))

                        while choix_cluster != 0 and choix_cluster != 1:
                            print(
                                "Erreur, veuillez entrer la valeur 0, 1 pour choisir le nombre de clusters que vous souhaitez : ")
                            choix_cluster = int(input("Votre choix : "))

                        time.sleep(2)
                        print("")

                        match choix_cluster:

                            # 2 clusters :
                            case 0:

                                n_clusters = 2

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode,
                                      "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)

                            # 3 clusters :
                            case 1:

                                n_clusters = 3

                                print("Vous avez choisi", n_clusters, "clusters")
                                print("")
                                print("--------------------------------------------------------------------------")
                                print("")

                                score = davies_score(data_arbre, kmeans_apprentissage(data_arbre, n_clusters))
                                print("Le score pour la métrique", metrique, "est :", score, "avec la méthode",
                                      methode, "pour", n_clusters, "clusters")
                                print("Affichage graphique : ")
                                affichage_graphique_davies(data_arbre)
'''