import pandas as pd
pd.set_option("future.no_silent_downcasting", True) #enlève Warning pour : Downcasting behavior in `replace`
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

data = pd.read_csv('Data_Arbre.csv')  # Importation des données
data.info()  # Informations sur les données
print(data.value_counts(subset = 'fk_arb_etat'))

#                                 Préparation des Données
print("===============================================================================================================")
print("        Préparation des Données")
print("===============================================================================================================")
#Extraction des données d’intérêt
data = data[['longitude', 'latitude', 'haut_tot', 'haut_tronc', 'tronc_diam', 'fk_arb_etat', 'fk_revetement', 'fk_stadedev', 'fk_port', 'age_estim', 'feuillage']]
#Encodage des données catégorielles
#-----------Encodage des données catégorielles
print("-------------------Apprentissage 2 : ")
from sklearn.preprocessing import OrdinalEncoder
enc = OrdinalEncoder()

for  each in ['fk_stadedev', 'fk_port', 'feuillage', 'fk_revetement']:
    data[each] = enc.fit_transform(data[[each]])
data.info()

#Normalisation des données
#transfomer dans la classe fk_arb_etat les arbres abttu et en place en 0
data['fk_arb_etat'] = data['fk_arb_etat'].replace(['Essouché', 'Non essouché'], 1)
data['fk_arb_etat'] = data['fk_arb_etat'].replace(['EN PLACE', 'Non SUPPRIMÉ', 'ABATTU', 'REMPLACÉ', 'SUPPRIMÉ'], 0)
data['fk_arb_etat'] = data['fk_arb_etat'].astype(float)
data.info()
print(data.value_counts(subset = 'fk_arb_etat'))
#Cible : (‘fk_arb_etat’)
A = data.drop('fk_arb_etat', axis=1)
Z = data['fk_arb_etat']
A_train, A_test, Z_train, Z_test = train_test_split(A, Z, test_size=0.2, random_state=42)

#                      Apprentissage Supervisé pour la classification
print("===============================================================================================================")
print("        Apprentissage Supervisé pour la classification")
print("===============================================================================================================")
#-----------Apprentissage 1 : RandomForestRegressor
print("-------------------Apprentissage 1 : Régression Logistique")

# Standardisation des données
scaler = StandardScaler()
A_train = scaler.fit_transform(A_train)
A_test = scaler.transform(A_test)

# 3. Choix et entraînement du modèle
# Initialisation du modèle Random Forest
model = RandomForestClassifier(n_estimators=100, random_state=42)

# Entraînement du modèle
model.fit(A_train, Z_train)

# 4. Évaluation du modèle
# Prédictions sur l'ensemble de test
y_pred = model.predict(A_test)

# Calcul des métriques de performance
accuracy = accuracy_score(Z_test, y_pred)
conf_matrix = confusion_matrix(Z_test, y_pred)
class_report = classification_report(Z_test, y_pred)

# Affichage des résultats
print(f"Accuracy: {accuracy}")
print("Confusion Matrix:")
print(conf_matrix)
print("Classification Report:")
print(class_report)



#-----------Apprentissage 2 :
print("-------------------Apprentissage 2 : ")

#-----------Apprentissage 3 : SVM




#                              Métriques pour la classification
print("===============================================================================================================")
print("        Métriques pour la classification")
print("===============================================================================================================")
