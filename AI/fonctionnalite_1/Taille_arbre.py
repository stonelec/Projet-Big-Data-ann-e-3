# --------------------------------------------------------------------
# ------------------------------ Import ------------------------------
# --------------------------------------------------------------------

import pandas as pd
import numpy as np
import time
import pickle

# Affichage :
import plotly.express as px
import matplotlib.pyplot as plt

# Méthodes
from sklearn.cluster import KMeans
from sklearn.cluster import Birch
from sklearn.cluster import AgglomerativeClustering

# Métriques :
from sklearn.metrics import silhouette_score
from sklearn.metrics import calinski_harabasz_score
from sklearn.metrics import davies_bouldin_score

# -------------------------------------------------------------------------------------
# ------------------------------ Préparation des données ------------------------------
# -------------------------------------------------------------------------------------

data_arbre = pd.read_csv("../AI_Patrimoine_Arboré_(RO).csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])

data_arbre_position_notre_data = pd.read_csv("../AI_Patrimoine_Arboré_(RO).csv",
                                             usecols=["X", "Y", "haut_tronc", "age_estim", "tronc_diam"])

data_arbre_position_data_prof = pd.read_csv("../Data_Arbre.csv",
                                            usecols=["longitude", "latitude", "haut_tronc", "age_estim", "tronc_diam"])

# ------------------------------------------------------------------------------
# ------------------------------ Afficher la data ------------------------------
# ------------------------------------------------------------------------------

# Regarder la taille des arbres en fonction de la fréquence des arbres

"""
haut_tot.hist(bins=50, figsize=(10, 10))
plt.show()
"""

# --------------------------------------------------------------------------------------------------
# ------------------------------ Apprentissage Non Supervisé : Kmeans ------------------------------
# --------------------------------------------------------------------------------------------------
def save_kmeans_apprentissage_fit(data_arbre, n_clusters):

    kmeans = KMeans(n_clusters=n_clusters, random_state=42).fit(data_arbre)

    with open('f1_kmeans_apprentissage.pkl', 'wb') as fichier:
        pickle.dump(kmeans, fichier)

    return 0

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

def affichage_notre_data(n_clusters):
    # On récupère les clusters :
    model = kmeans_apprentissage(data_arbre_position_notre_data, n_clusters)

    # On rajoute une colonne avec les clusters
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
    fig.update_layout(margin={"r": 0, "t": 0, "l": 0, "b": 0})

    fig.show()


def affichage_data_prof(n_clusters):
    # On récupère les clusters :
    model = kmeans_apprentissage(data_arbre_position_data_prof, n_clusters)

    # On rajoute une colonne avec les clusters
    data_arbre_position_data_prof['cluster'] = model

    data_arbre_position_data_prof['haut_tot'] = pd.read_csv("../Data_Arbre.csv", usecols=["haut_tot"])

    fig = px.scatter_mapbox(data_arbre_position_data_prof,
                            lat="latitude",
                            lon="longitude",
                            color="cluster",
                            color_discrete_sequence=["blue", "green", "red"],
                            hover_data=["haut_tronc", "age_estim", "tronc_diam", "haut_tot"],
                            zoom=12.5,
                            height=800,
                            width=800)

    fig.update_layout(mapbox_style="open-street-map")
    fig.update_layout(margin={"r": 0, "t": 0, "l": 0, "b": 0})

    fig.show()


print("Affichage avec les données fournit pour 2 clusters : ")
affichage_data_prof(2)

print("Affichage avec les données fournit pour 3 clusters : ")
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

    # On récupère le score ici et on le garde
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

    # Notre data
    case 0:

        data_arbre = pd.read_csv("../AI_Patrimoine_Arboré_(RO).csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])
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

                                #Pour les valeurs dans le pkl
                                save_kmeans_apprentissage_fit(data_arbre, n_clusters)

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

                                # Pour les valeurs dans le pkl
                                save_kmeans_apprentissage_fit(data_arbre, n_clusters)

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

                                # Pour les valeurs dans le pkl
                                save_kmeans_apprentissage_fit(data_arbre, n_clusters)

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

                                # Pour les valeurs dans le pkl
                                save_kmeans_apprentissage_fit(data_arbre, n_clusters)

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

                                # Pour les valeurs dans le pkl
                                save_kmeans_apprentissage_fit(data_arbre, n_clusters)

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

                                # Pour les valeurs dans le pkl
                                save_kmeans_apprentissage_fit(data_arbre, n_clusters)

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

    # Data prof
    case 1:

        data_arbre = pd.read_csv("../Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])
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

# --------------------------------------------------------------------------------
# ------------------------------ Tout les résultats ------------------------------
# --------------------------------------------------------------------------------

print("")
print("--------------------------------------------------------------------------")
print("")

print("Voulez-vous afficher toutes les valeurs : ")
print("Oui : 0")
print("Non : 1")

choix_affichage_tout = int(input("Votre choix : "))

while choix_affichage_tout != 0 and choix_affichage_tout != 1:
    print("Erreur, veuillez entrer la valeur 0, 1 ou 2 pour choisir si vous affichez ou non : ")
    choix_affichage_tout = int(input("Votre choix : "))

time.sleep(2)
print("")

match choix_affichage_tout:

    case 0:

        deux_clusters = 2
        trois_clusters = 3

        data_arbre_notre = pd.read_csv("AI_Patrimoine_Arboré_(RO).csv",
                                       usecols=["haut_tronc", "age_estim", "tronc_diam"])
        data_arbre_prof = pd.read_csv("Data_Arbre.csv", usecols=["haut_tronc", "age_estim", "tronc_diam"])

        print("------------------------------------------------------------------------")
        print("------------------------------ Notre data ------------------------------")
        print("------------------------------------------------------------------------")

        print("---------- KMeans ----------")

        print("Pour 2 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_notre, kmeans_apprentissage(data_arbre_notre, deux_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_notre, kmeans_apprentissage(data_arbre_notre, deux_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_notre, kmeans_apprentissage(data_arbre_notre, deux_clusters)))

        print("-----------")

        print("Pour 3 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_notre, kmeans_apprentissage(data_arbre_notre, trois_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_notre, kmeans_apprentissage(data_arbre_notre, trois_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_notre, kmeans_apprentissage(data_arbre_notre, trois_clusters)))

        print("---------- BIRCH ----------")

        print("Pour 2 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_notre, birch_apprentissage(data_arbre_notre, deux_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_notre, birch_apprentissage(data_arbre_notre, deux_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_notre, birch_apprentissage(data_arbre_notre, deux_clusters)))

        print("-----------")

        print("Pour 3 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_notre, birch_apprentissage(data_arbre_notre, trois_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_notre, birch_apprentissage(data_arbre_notre, trois_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_notre, birch_apprentissage(data_arbre_notre, trois_clusters)))

        print("---------- AgglomerativeClustering ----------")

        print("Pour 2 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_notre, agglomerative_clustering_apprentissage(data_arbre_notre, deux_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_notre, agglomerative_clustering_apprentissage(data_arbre_notre, deux_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_notre, agglomerative_clustering_apprentissage(data_arbre_notre, deux_clusters)))

        print("-----------")

        print("Pour 3 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_notre, agglomerative_clustering_apprentissage(data_arbre_notre, trois_clusters)))
        print("Calinski-Harabasz Index : ", calinski_score(data_arbre_notre,
                                                           agglomerative_clustering_apprentissage(data_arbre_notre,
                                                                                                  trois_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_notre, agglomerative_clustering_apprentissage(data_arbre_notre, trois_clusters)))

        print("--------------------------------------------------------------------------")
        print("------------------------------ Data fournit ------------------------------")
        print("--------------------------------------------------------------------------")

        print("---------- KMeans ----------")

        print("Pour 2 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_prof, kmeans_apprentissage(data_arbre_prof, deux_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_prof, kmeans_apprentissage(data_arbre_prof, deux_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_prof, kmeans_apprentissage(data_arbre_prof, deux_clusters)))

        print("-----------")

        print("Pour 3 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_prof, kmeans_apprentissage(data_arbre_prof, trois_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_prof, kmeans_apprentissage(data_arbre_prof, trois_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_prof, kmeans_apprentissage(data_arbre_prof, trois_clusters)))

        print("---------- BIRCH ----------")

        print("Pour 2 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_prof, birch_apprentissage(data_arbre_prof, deux_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_prof, birch_apprentissage(data_arbre_prof, deux_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_prof, birch_apprentissage(data_arbre_prof, deux_clusters)))

        print("-----------")

        print("Pour 3 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_prof, birch_apprentissage(data_arbre_prof, trois_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_prof, birch_apprentissage(data_arbre_prof, trois_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_prof, birch_apprentissage(data_arbre_prof, trois_clusters)))

        print("---------- AgglomerativeClustering ----------")

        print("Pour 2 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_prof, agglomerative_clustering_apprentissage(data_arbre_prof, deux_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_prof, agglomerative_clustering_apprentissage(data_arbre_prof, deux_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_prof, agglomerative_clustering_apprentissage(data_arbre_prof, deux_clusters)))

        print("-----------")

        print("Pour 3 clusters : ")
        print("Silhouette Coefficient : ",
              sil_score(data_arbre_prof, agglomerative_clustering_apprentissage(data_arbre_prof, trois_clusters)))
        print("Calinski-Harabasz Index : ",
              calinski_score(data_arbre_prof, agglomerative_clustering_apprentissage(data_arbre_prof, trois_clusters)))
        print("Davies-Bouldin Index : ",
              davies_score(data_arbre_prof, agglomerative_clustering_apprentissage(data_arbre_prof, trois_clusters)))

    case 1:

        print("Merci à vous, FIN")
