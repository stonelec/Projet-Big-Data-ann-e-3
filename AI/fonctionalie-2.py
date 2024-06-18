import pandas as pd
pd.set_option("future.no_silent_downcasting", True) #enlève Warning pour : Downcasting behavior in `replace`
import plotly as plt

data = pd.read_csv('Data_Arbre.csv')  # Importation des données
data.info()  # Informations sur les données
print(data.value_counts(subset = 'age_estim'))

#                                 Préparation des Données
print("===============================================================================================================")
print("        Préparation des Données")
print("===============================================================================================================")
#Extraction des données d’intérêt
data = data[['longitude', 'latitude', 'haut_tot', 'haut_tronc', 'tronc_diam', 'fk_arb_etat', 'fk_revetement', 'fk_stadedev', 'fk_port', 'age_estim', 'feuillage', 'remarquable']]
#Encodage des données catégorielles
#-----------Encodage des données catégorielles
print("-------------------Apprentissage 2 : ")
from sklearn.preprocessing import OrdinalEncoder
enc = OrdinalEncoder()

for  each in ['fk_stadedev', 'fk_port', 'feuillage', 'fk_revetement', 'remarquable']:
    data[each] = enc.fit_transform(data[[each]])
data.info()

#Normalisation des données
#Cible : (‘age_estim’)
train_data = data.drop("age_estim", axis=1) #drop labels for training set
print(train_data)
train_labels = data["age_estim"].copy()
print(train_labels)

#                      Apprentissage Supervisé pour la classification
print("===============================================================================================================")
print("        Apprentissage Supervisé pour la classification")
print("===============================================================================================================")
#-----------Apprentissage 1 :
print("-------------------Apprentissage 1 : ")


#Evaluation du modèle
#Prédiction

#Matrice de confusion

#Précision



#-----------Apprentissage 2 :
print("-------------------Apprentissage 2 : ")


#-----------Apprentissage 3 :
print("-------------------Apprentissage 2 : ")



#                              Métriques pour la classification
print("===============================================================================================================")
print("        Métriques pour la classification")
print("===============================================================================================================")
