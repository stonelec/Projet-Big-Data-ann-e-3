# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
from sklearn.model_selection import train_test_split

# Charger la base de données
data = pd.read_csv('AI_Patrimoine_Arboré_(RO).csv')

# Sélectionner les caractéristiques basées sur la corrélation
features = ['tronc_diam', 'haut_tot', 'haut_tronc']
target = 'age_estim'

# Filtrer les colonnes pertinentes
X = data[features]
Y = data[target]

# Diviser les données en ensembles d'entraînement et de test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=42)

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
y_train_classes = np.array([age_class(age) for age in Y_train])
y_test_classes = np.array([age_class(age) for age in Y_test])

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
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report, confusion_matrix

# Définir la plage de nombres de voisins à tester
range_n_neighbors = range(2, 16)

tab_knn = []
tab_pred_knn = []

for n_neighbors in range_n_neighbors:
    knn = KNeighborsClassifier(n_neighbors=n_neighbors)
    knn.fit(X_train_scaled, y_train_classes)
    y_pred = knn.predict(X_test_scaled)

    tab_knn.append(knn)
    tab_pred_knn.append(y_pred)


# ======================================================================================================================
# ============================================ Évaluation et visualisation =============================================
# ======================================================================================================================

# ---------------------------------------- Précision en fonction du nombre de voisins ----------------------------------
import matplotlib.pyplot as plt

# Liste pour stocker les scores de précision
accuracy_scores = []

for n_neighbors in range_n_neighbors:
    # Calculer le score de précision et l'ajouter à la liste
    accuracy = accuracy_score(y_test_classes, tab_pred_knn[n_neighbors-2])
    accuracy_scores.append(accuracy)

    print(f'Nombre de voisins: {n_neighbors}, accuracy: {accuracy:.4f}')

mean_accuracy_score = np.mean(accuracy_scores)
print(f'Moyenne des scores d\'accuracy: {mean_accuracy_score:.2f}')

# Tracer les scores de précision pour chaque nombre de voisins
plt.plot(range_n_neighbors, accuracy_scores, marker='o')
plt.axhline(y=mean_accuracy_score, color='r', linestyle='--', label=f'Moyenne = {mean_accuracy_score:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Précision')
plt.title('Accuracy en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.grid(True)
plt.show()

# ---------------------------------------- Validation croisée en fonction du nombre de voisins -------------------------
from sklearn.model_selection import cross_val_score

cross_val_scores = []

# Calculer le score de validation croisée pour chaque nombre de voisins
for n_neighbors in range_n_neighbors:
    # Calculer le score de validation croisée avec 5 valeurs croisées
    scores = cross_val_score(tab_knn[n_neighbors-2], X_train_scaled, y_train_classes, cv=5, scoring='accuracy')
    cross_val_scores.append(np.mean(scores))

    print(f'Nombre de voisins: {n_neighbors}, score en valeur croisée: {scores:.4f}')

# Calculer la moyenne des scores de validation croisée
mean_cross_val_score = np.mean(cross_val_scores)
print(f'Moyenne des scores de validation croisée en accuracy: {mean_cross_val_score:.2f}')

# Tracer les scores de validation croisée pour chaque nombre de voisins
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, cross_val_scores, marker='o', linestyle='-', label='Scores de validation croisée')
plt.axhline(y=mean_cross_val_score, color='r', linestyle='--', label=f'Moyenne = {mean_cross_val_score:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Score de validation croisée (accuracy)')
plt.title('Score de validation croisée en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.grid(True)
plt.show()

# -------------------------------------------- RMSE -----------------------------------------------------------
from sklearn.metrics import mean_squared_error

rmse_scores = []

# Calculer la RMSE pour chaque modèle KNN
for n_neighbors in range_n_neighbors:
    knn = tab_knn[n_neighbors - 2]  # Récupérer le modèle KNN correspondant
    y_pred = tab_pred_knn[n_neighbors - 2]  # Récupérer les prédictions correspondantes

    # Calculer la RMSE
    rmse = np.sqrt(mean_squared_error(y_test_classes, y_pred))
    rmse_scores.append(rmse)

    print(f'Nombre de voisins: {n_neighbors}, RMSE: {rmse:.4f}')

# Calculer la moyenne des scores de validation croisée
mean_rmse_score = np.mean(rmse_scores)
print(f'Moyenne des RMSE: {mean_rmse_score:.2f}')

# Tracer les scores de RMSE pour chaque nombre de voisins
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, rmse_scores, marker='o', linestyle='-')
plt.xlabel('Nombre de voisins')
plt.ylabel('RMSE')
plt.title('RMSE en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.grid(True)
plt.show()

# ------------------------------------------------- Matrice de confusion -----------------------------------------------
import seaborn as sns
"""
# Visualiser la matrice de confusion
conf_matrix = confusion_matrix(y_test_classes, y_pred)
sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues',
            xticklabels=['0-10', '10-50', '50-100', '100-200'],
            yticklabels=['0-10', '10-50', '50-100', '100-200'])
plt.xlabel('Prédictions')
plt.ylabel('Vérités terrain')
plt.title(f'Matrice de confusion pour K-Nearest Neighbors avec n = {num_neighbors} - score = {accuracy:.2f}')
plt.show()
"""

# ------------------------------------------------- Précision et Rappel ------------------------------------------------
from sklearn.metrics import precision_score, recall_score, f1_score

precision_scores = []
recall_scores = []
f1_scores = []

# Évaluer la précision et le rappel pour chaque nombre de voisins
for n_neighbors in range_n_neighbors:
    # Calcul de la précision moyenne pondérée
    precision = precision_score(y_test_classes, tab_pred_knn[n_neighbors-2], average='weighted', zero_division=1)

    # Calcul du rappel moyen pondéré
    recall = recall_score(y_test_classes, tab_pred_knn[n_neighbors-2], average='weighted', zero_division=1)

    # Calcul du f1_score
    f1 = f1_score(y_test_classes, tab_pred_knn[n_neighbors-2], average='weighted', zero_division=1)

    precision_scores.append(precision)
    recall_scores.append(recall)
    f1_scores.append(f1)

    print(f'Nombre de voisins: {n_neighbors}, Précision: {precision:.4f}, Rappel: {recall:.4f}, Ratio: {f1:.4f}')

# Calculer la moyenne des scores de validation croisée
mean_precision_score = np.mean(precision_scores)
print(f'Moyenne des scores de précision: {mean_precision_score:.2f}')

plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, precision_scores, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score, color='r', linestyle='--', label=f'Moyenne = {mean_precision_score:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Précision')
plt.title('Précision en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.grid(True)
plt.show()

# Calculer la moyenne des scores de validation croisée
mean_recall_score = np.mean(recall_scores)
print(f'Moyenne des scores de rappel: {mean_recall_score:.2f}')

plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, recall_scores, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score, color='r', linestyle='--', label=f'Moyenne = {mean_recall_score:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Rappel')
plt.title('Rappel en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.grid(True)
plt.show()

# Calculer la moyenne des scores de validation croisée
mean_f1_score = np.mean(f1_scores)
print(f'Moyenne des F1-score: {mean_f1_score:.2f}')

plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, f1_scores, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score, color='r', linestyle='--', label=f'Moyenne = {mean_f1_score:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('F1-score')
plt.title('F1-score en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.grid(True)
plt.show()

# ----------------------------------------------------- Courbe ROC -----------------------------------------------------

from sklearn.metrics import roc_curve, auc
from sklearn.preprocessing import label_binarize

y_prob = tab_knn[5].predict_proba(X_test_scaled)

# Binariser les classes pour chaque classe pour la courbe ROC
y_test_bin = label_binarize(y_test_classes, classes=[0, 1, 2, 3])
n_classes = y_test_bin.shape[1]

# Calculer les courbes ROC et l'AUC pour chaque classe
plt.figure(figsize=(8, 6))

for i in range(n_classes):
    fpr, tpr, _ = roc_curve(y_test_bin[:, i], y_prob[:, i])
    roc_auc = auc(fpr, tpr)
    plt.plot(fpr, tpr, lw=2, label=f'Classe {i} (AUC = {roc_auc:.2f})')

plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('Taux de Faux Positifs')
plt.ylabel('Taux de Vrais Positifs')
plt.title('Courbe ROC pour le modèle KNN')
plt.legend(loc='lower right')
plt.grid(True)
plt.show()
