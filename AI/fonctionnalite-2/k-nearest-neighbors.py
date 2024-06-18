# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
from sklearn.model_selection import train_test_split

# Charger la base de données
data = pd.read_csv('../AI_Patrimoine_Arboré_(RO).csv')

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
# ====================================== Implémentation du modèle K-Nearest Neighbors ==================================
# ======================================================================================================================
from sklearn.neighbors import KNeighborsClassifier

# Définir la plage de nombres de voisins à tester
range_n_neighbors = range(2, 16)

tab_knn = []
tab_pred_knn = []

for n_neighbors in range_n_neighbors:
    knn = KNeighborsClassifier(n_neighbors=n_neighbors)
    knn.fit(X_train_scaled, y_train_classes)
    y_pred_knn = knn.predict(X_test_scaled)

    tab_knn.append(knn)
    tab_pred_knn.append(y_pred_knn)


# ======================================================================================================================
# ============================================ Évaluation et visualisation =============================================
# ======================================================================================================================
import matplotlib.pyplot as plt
# ---------------------------------------- Précision en fonction du nombre de voisins ----------------------------------
from sklearn.metrics import accuracy_score

accuracy_scores_knn = []

for n_neighbors in range_n_neighbors:
    accuracy_knn = accuracy_score(y_test_classes, tab_pred_knn[n_neighbors - 2])      # Calculer le score de précision et l'ajouter à la liste
    accuracy_scores_knn.append(accuracy_knn)

    print(f'Nombre de voisins: {n_neighbors}, accuracy: {accuracy_knn:.4f}')

mean_accuracy_score_knn = np.mean(accuracy_scores_knn)
print(f'Moyenne des scores d\'accuracy: {mean_accuracy_score_knn:.2f}')

# Tracer les scores de précision pour chaque nombre de voisins
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, accuracy_scores_knn, marker='o')
plt.axhline(y=mean_accuracy_score_knn, color='r', linestyle='--', label=f'Moyenne = {mean_accuracy_score_knn:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Précision')
plt.title('Accuracy en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()


# ---------------------------------------- Validation croisée en fonction du nombre de voisins -------------------------
from sklearn.model_selection import cross_val_score

cross_val_scores_knn = []

# Calculer le score de validation croisée pour chaque nombre de voisins
for n_neighbors in range_n_neighbors:
    scores_knn = cross_val_score(tab_knn[n_neighbors - 2], X_train_scaled, y_train_classes, cv=5, scoring='accuracy')   # Calculer le score de validation croisée avec 5 valeurs croisées
    cross_val_scores_knn.append(np.mean(scores_knn))

    print(f'Nombre de voisins: {n_neighbors}, scores de validation croisée: {scores_knn}')

# Calculer la moyenne des scores de validation croisée
mean_cross_val_score_knn = np.mean(cross_val_scores_knn)
print(f'Moyenne des scores de validation croisée en accuracy: {mean_cross_val_score_knn:.2f}')

# Tracer les scores de validation croisée pour chaque nombre de voisins
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, cross_val_scores_knn, marker='o', linestyle='-', label='Scores de validation croisée')
plt.axhline(y=mean_cross_val_score_knn, color='r', linestyle='--', label=f'Moyenne = {mean_cross_val_score_knn:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Score de validation croisée (accuracy)')
plt.title('Score de validation croisée en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# -------------------------------------------- RMSE -----------------------------------------------------------
from sklearn.metrics import mean_squared_error

rmse_scores_knn = []

# Calculer la RMSE pour chaque modèle KNN
for n_neighbors in range_n_neighbors:
    rmse_knn = np.sqrt(mean_squared_error(y_test_classes, tab_pred_knn[n_neighbors - 2]))
    rmse_scores_knn.append(rmse_knn)

    print(f'Nombre de voisins: {n_neighbors}, RMSE: {rmse_knn:.4f}')

# Calculer la moyenne des scores de validation croisée
mean_rmse_score_knn = np.mean(rmse_scores_knn)
print(f'Moyenne des RMSE: {mean_rmse_score_knn:.2f}')

# Tracer les scores de RMSE pour chaque nombre de voisins
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, rmse_scores_knn, marker='o', linestyle='-')
plt.axhline(y=mean_rmse_score_knn, color='r', linestyle='--', label=f'Moyenne = {mean_rmse_score_knn:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('RMSE')
plt.title('RMSE en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# ------------------------------------------------- Matrice de confusion -----------------------------------------------
from sklearn.metrics import confusion_matrix
import seaborn as sns

for n_neighbors in range_n_neighbors:
    conf_matrix_knn = confusion_matrix(y_test_classes, tab_pred_knn[n_neighbors - 2])

    print(f'Matrice de confusion pour K-Nearest Neighbors avec n = {n_neighbors}')
    print(conf_matrix_knn)
    """
    plt.figure(figsize=(10, 6))
    sns.heatmap(conf_matrix_knn, annot=True, fmt='d', cmap='Blues',
                xticklabels=['0-10', '10-50', '50-100', '100-200'],
                yticklabels=['0-10', '10-50', '50-100', '100-200'])
    plt.xlabel('Prédictions')
    plt.ylabel('Vérités terrain')
    plt.title(f'Matrice de confusion pour K-Nearest Neighbors avec n = {n_neighbors} - score = {accuracy_scores_knn[n_neighbors-2]:.2f}')
    plt.show()
    """


# ------------------------------------------------- Précision et Rappel ------------------------------------------------
from sklearn.metrics import precision_score, recall_score, f1_score

precision_scores_knn = []
recall_scores_knn = []
f1_scores_knn = []

# Évaluer la précision et le rappel pour chaque nombre de voisins
for n_neighbors in range_n_neighbors:
    precision_knn = precision_score(y_test_classes, tab_pred_knn[n_neighbors - 2], average='weighted', zero_division=1)     # Calcul de la précision moyenne pondérée

    recall_knn = recall_score(y_test_classes, tab_pred_knn[n_neighbors - 2], average='weighted', zero_division=1)           # Calcul du rappel moyen pondéré

    f1_knn = f1_score(y_test_classes, tab_pred_knn[n_neighbors-2], average='weighted', zero_division=1)                     # Calcul du f1_score

    precision_scores_knn.append(precision_knn)
    recall_scores_knn.append(recall_knn)
    f1_scores_knn.append(f1_knn)

    print(f'Nombre de voisins: {n_neighbors}, Précision: {precision_knn:.4f}, Rappel: {recall_knn:.4f}, Ratio: {f1_knn:.4f}')

# Calculer les moyennes de la précision, du rappel et du F1-score
mean_precision_score_knn = np.mean(precision_scores_knn)
print(f'Moyenne des scores de précision: {mean_precision_score_knn:.2f}')

mean_recall_score_knn = np.mean(recall_scores_knn)
print(f'Moyenne des scores de rappel: {mean_recall_score_knn:.2f}')

mean_f1_score_knn = np.mean(f1_scores_knn)
print(f'Moyenne des F1-score: {mean_f1_score_knn:.2f}')

# Afficher les graphiques de la précision, du rappel et du F1-score
# Précision
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, precision_scores_knn, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score_knn, color='r', linestyle='--', label=f'Moyenne = {mean_precision_score_knn:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Précision')
plt.title('Précision en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()
# Rappel
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, recall_scores_knn, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score_knn, color='r', linestyle='--', label=f'Moyenne = {mean_recall_score_knn:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Rappel')
plt.title('Rappel en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()
# F1-score
plt.figure(figsize=(10, 6))
plt.plot(range_n_neighbors, f1_scores_knn, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score_knn, color='r', linestyle='--', label=f'Moyenne = {mean_f1_score_knn:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('F1-score')
plt.title('F1-score en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# ----------------------------------------------------- Courbe ROC -----------------------------------------------------
from sklearn.metrics import roc_curve, auc
from sklearn.preprocessing import label_binarize

tab_y_prob_knn = []
for n_neighbors in range_n_neighbors:
    y_prob_knn = tab_knn[n_neighbors-2].predict_proba(X_test_scaled)
    tab_y_prob_knn.append(y_prob_knn)

# Binariser les classes pour chaque classe pour la courbe ROC
y_test_bin = label_binarize(y_test_classes, classes=[0, 1, 2, 3])
n_classes = y_test_bin.shape[1]

# Calculer les courbes ROC et l'AUC pour chaque nombre d'arbres et pour chaque classe
for n_neighbors in range_n_neighbors:

    tab_fpr_knn = []
    tab_tpr_knn = []

    plt.figure(figsize=(10, 6))
    for i in range(n_classes):
        false_positive_rate, true_positive_rate, _ = roc_curve(y_test_bin[:, i], tab_y_prob_knn[n_neighbors-2][:, i])
        roc_auc = auc(false_positive_rate, true_positive_rate)  # roc_auc = roc _ area under the curve

        tab_fpr_knn.append(false_positive_rate)
        tab_tpr_knn.append(true_positive_rate)

        # Affichage de la courbe ROC pour chaque quantité d'arbres et pour chaque classe
        plt.plot(false_positive_rate, true_positive_rate, lw=2, label=f'Classe {i} (AUC = {roc_auc:.2f})')
    plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.xlabel('Taux de Faux Positifs')
    plt.ylabel('Taux de Vrais Positifs')
    plt.title(f'Courbe ROC pour le modèle K-Nearest Neighbors avec {n_neighbors} voisins, pour chaque classe')
    plt.legend(loc='lower right')
    plt.grid(True)
    plt.show()

    # Affichage de la courbe ROC pour chaque quantité d'arbres
    # Combiner les courbes ROC pour une courbe globale
    fpr_global = np.unique(np.concatenate(tab_fpr_knn))
    tpr_global = np.zeros_like(fpr_global)

    for fpr_i, tpr_i in zip(tab_fpr_knn, tab_tpr_knn):
        tpr_global += np.interp(fpr_global, fpr_i, tpr_i)

    tpr_global /= n_classes  # Moyenne des vrais positifs pour chaque taux de faux positifs

    roc_auc_global = auc(fpr_global, tpr_global)

    plt.plot(fpr_global, tpr_global, color='b', lw=2, label=f'ROC (AUC = {roc_auc_global:.2f})')
    plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.xlabel('Taux de Faux Positifs')
    plt.ylabel('Taux de Vrais Positifs')
    plt.title(f'Courbe ROC pour le modèle K-Nearest Neighbors avec {n_neighbors} voisins')
    plt.legend(loc='lower right')
    plt.grid(True)
    plt.show()

