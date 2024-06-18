# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
from sklearn.model_selection import train_test_split

# Charger la base de données
df = pd.read_csv('AI_Patrimoine_Arboré_(RO).csv')

# Examiner les données pour identifier les colonnes pertinentes
print(df.head())

# Sélectionner les caractéristiques basées sur la corrélation
features = ['tronc_diam', 'haut_tot', 'haut_tronc']
target = 'age_estim'

# Filtrer les colonnes pertinentes
X = df[features]
y = df[target]

# Diviser les données en ensembles d'entraînement et de test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# ======================================================================================================================
# ============================================= Encodage des classes d'âge =============================================
# ======================================================================================================================
import numpy as np

# Définir les classes d'âge
def age_class(age):
    if age <= 10:
        return 0  # Classe 0: [0, 10]
    elif age <= 50:
        return 1  # Classe 1: [10, 50]
    elif age <= 100:
        return 2  # Classe 2: [50, 100]
    elif age <= 200:
        return 3  # Classe 3: [100, 200]
    else:
        return 4  # Classe 4: > 200 (facultatif)

# Appliquer la fonction pour créer des labels
y_train_classes = np.array([age_class(age) for age in y_train])
y_test_classes = np.array([age_class(age) for age in y_test])

# ======================================================================================================================
# ============================================ Normalisation des données ==============================================
# ======================================================================================================================
from sklearn.preprocessing import StandardScaler

# Standardiser les données
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# ======================================================================================================================
# ====================================== Implémentation du modèle K-Nearest Neighbors ==================================
# ======================================================================================================================
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import classification_report, confusion_matrix

# Entraîner le modèle KNN
knn = KNeighborsClassifier(n_neighbors=5)  # Changer le nombre de voisins
knn.fit(X_train_scaled, y_train_classes)

# Prédire sur l'ensemble de test
y_pred = knn.predict(X_test_scaled)

# Évaluer le modèle
print("Classification Report:")
print(classification_report(y_test_classes, y_pred))

print("Confusion Matrix:")
print(confusion_matrix(y_test_classes, y_pred))

# ======================================================================================================================
# ============================================ Évaluation et visualisation ============================================
# ======================================================================================================================
import seaborn as sns
import matplotlib.pyplot as plt

# Visualiser la matrice de confusion
conf_matrix = confusion_matrix(y_test_classes, y_pred)
sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues',
            xticklabels=['0-10', '10-50', '50-100', '100-200'],
            yticklabels=['0-10', '10-50', '50-100', '100-200'])
plt.xlabel('Prédictions')
plt.ylabel('Vérités terrain')
plt.title('Matrice de confusion')
plt.show()







