# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
from sklearn.model_selection import train_test_split

# Charger la base de données
data = pd.read_csv('../AI_Patrimoine_Arboré_(RO).csv')
#data = pd.read_csv('../Data_Arbre.csv')

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
# ===================================== Implémentation du modèle Random Forest Classification ==========================
# ======================================================================================================================
from sklearn.ensemble import RandomForestClassifier

# Définir la plage de nombres d'arbres à tester
range_n_estimators = range(10, 110, 10)  # le n_estimators est le nombre d'arbres dans la forêt; il va de 10 à 100; On teste toutes les dizaines
n_estimators = len(range_n_estimators)
tab_rf = []
tab_pred_rf = []

for n_estimators in range_n_estimators:
    rf = RandomForestClassifier(n_estimators=n_estimators, random_state=42)
    rf.fit(X_train_scaled, y_train_classes)
    y_pred_rf = rf.predict(X_test_scaled)

    tab_rf.append(rf)
    tab_pred_rf.append(y_pred_rf)


# ======================================================================================================================
# ============================================ Évaluation et visualisation =============================================
# ======================================================================================================================
import matplotlib.pyplot as plt
# --------------------------------------- Précision en fonction du nombre d'arbes --------------------------------------
from sklearn.metrics import accuracy_score

accuracy_scores_rf = []

# Évaluation des performances pour chaque nombre d'arbres (n_estimators)
for idx, n_estimators in enumerate(range_n_estimators):
    # enumerate retourne à la fois l'index et la valeur de chaque élément
    accuracy_rf = accuracy_score(y_test_classes, tab_pred_rf[idx])  # Calculer le score de précision et l'ajouter à la liste
    accuracy_scores_rf.append(accuracy_rf)

    print(f'Nombre d\'arbres: {n_estimators}, accuracy: {accuracy_rf:.4f}')

# Calculer la moyenne des scores de précision
mean_accuracy_score_rf = np.mean(accuracy_scores_rf)
print(f'Moyenne des scores d\'accuracy: {mean_accuracy_score_rf:.2f}')

# Tracer les scores de précision pour chaque nombre d'arbres
plt.figure(figsize=(10, 6))
plt.plot(range_n_estimators, accuracy_scores_rf, marker='o')
plt.axhline(y=mean_accuracy_score_rf, color='r', linestyle='--', label=f'Moyenne = {mean_accuracy_score_rf:.2f}')
plt.xlabel('Nombre d\'arbres')
plt.ylabel('Précision')
plt.title('Accuracy en fonction du nombre d\'arbres pour Random Forest')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# ---------------------------------- Validation croisée en fonction du nombre d'arbes ----------------------------------
from sklearn.model_selection import cross_val_score

cross_val_scores_rf = []

# Calculer le score de validation croisée pour chaque nombre d'arbres
for idx, n_estimators in enumerate(range_n_estimators):
    scores_rf = cross_val_score(tab_rf[idx], X_train_scaled, y_train_classes, cv=5, scoring='accuracy')   # Calculer le score de validation croisée avec 5 valeurs croisées
    cross_val_scores_rf.append(np.mean(scores_rf))

    print(f'Nombre d\'arbres: {n_estimators}, scores de validation croisée: {scores_rf}')

# Calculer la moyenne des scores de validation croisée
mean_cross_val_score_rf = np.mean(cross_val_scores_rf)
print(f'Moyenne des scores de validation croisée en accuracy: {mean_cross_val_score_rf:.2f}')

# Tracer les scores de validation croisée pour chaque nombre d'arbres
plt.figure(figsize=(10, 6))
plt.plot(range_n_estimators, cross_val_scores_rf, marker='o', linestyle='-', label='Scores de validation croisée')
plt.axhline(y=mean_cross_val_score_rf, color='r', linestyle='--', label=f'Moyenne = {mean_cross_val_score_rf:.2f}')
plt.xlabel('Nombre d\'arbres')
plt.ylabel('Score de validation croisée (accuracy)')
plt.title('Score de validation croisée en fonction du nombre d\'arbres pour Random Forest')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# -------------------------------------------- RMSE -----------------------------------------------------------
from sklearn.metrics import mean_squared_error

rmse_scores_rf = []

# Calculer la RMSE pour chaque modèle Random Forest
for idx, n_estimators in enumerate(range_n_estimators):
    rmse_rf = np.sqrt(mean_squared_error(y_test_classes, tab_pred_rf[idx]))
    rmse_scores_rf.append(rmse_rf)

    print(f'Nombre de voisins: {n_estimators}, RMSE: {rmse_rf:.4f}')

# Calculer la moyenne des scores de validation croisée
mean_rmse_score_rf = np.mean(rmse_scores_rf)
print(f'Moyenne des RMSE: {mean_rmse_score_rf:.2f}')

# Tracer les scores de RMSE pour chaque nombre d'arbres
plt.figure(figsize=(10, 6))
plt.plot(range_n_estimators, rmse_scores_rf, marker='o', linestyle='-')
plt.axhline(y=mean_rmse_score_rf, color='r', linestyle='--', label=f'Moyenne = {mean_rmse_score_rf:.2f}')
plt.xlabel('Nombre d\'arbres')
plt.ylabel('RMSE')
plt.title('RMSE en fonction du nombre d\'arbres pour Random Forest')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# ------------------------------------------------- Matrice de confusion -----------------------------------------------
from sklearn.metrics import confusion_matrix
import seaborn as sns

for idx, n_estimators in enumerate(range_n_estimators):
    conf_matrix_rf = confusion_matrix(y_test_classes, tab_pred_rf[idx])

    print(f'Matrice de confusion pour Random Forest avec n = {n_estimators}')
    print(conf_matrix_rf)
    """
    plt.figure(figsize=(10, 6))
    sns.heatmap(conf_matrix_rf, annot=True, fmt='d', cmap='Blues',
                xticklabels=['0-10', '10-50', '50-100', '100-200'],
                yticklabels=['0-10', '10-50', '50-100', '100-200'])
    plt.xlabel('Prédictions')
    plt.ylabel('Vérités terrain')
    plt.title(f'Matrice de confusion pour Random Forest avec n = {n_estimators} - score = {accuracy_scores_rf[idx]:.2f}')
    plt.show()
    """


# ------------------------------------------------- Précision et Rappel ------------------------------------------------
from sklearn.metrics import precision_score, recall_score, f1_score

precision_scores_rf = []
recall_scores_rf = []
f1_scores_rf = []

# Évaluer la précision et le rappel pour chaque nombre de voisins
for idx, n_estimators in enumerate(range_n_estimators):
    precision_rf = precision_score(y_test_classes, tab_pred_rf[idx], average='weighted', zero_division=1)     # Calcul de la précision moyenne pondérée

    recall_rf = recall_score(y_test_classes, tab_pred_rf[idx], average='weighted', zero_division=1)           # Calcul du rappel moyen pondéré

    f1_rf = f1_score(y_test_classes, tab_pred_rf[idx], average='weighted', zero_division=1)                     # Calcul du f1_score

    precision_scores_rf.append(precision_rf)
    recall_scores_rf.append(recall_rf)
    f1_scores_rf.append(f1_rf)

    print(f'Nombre d\'arbres: {n_estimators}, Précision: {precision_rf:.4f}, Rappel: {recall_rf:.4f}, Ratio: {f1_rf:.4f}')

# Calculer les moyennes de la précision, du rappel et du F1-score
mean_precision_score_rf = np.mean(precision_scores_rf)
print(f'Moyenne des scores de précision: {mean_precision_score_rf:.2f}')

mean_recall_score_rf = np.mean(recall_scores_rf)
print(f'Moyenne des scores de rappel: {mean_recall_score_rf:.2f}')

mean_f1_score_rf = np.mean(f1_scores_rf)
print(f'Moyenne des F1-score: {mean_f1_score_rf:.2f}')

# Afficher les graphiques de la précision, du rappel et du F1-score
# Précision
plt.figure(figsize=(10, 6))
plt.plot(range_n_estimators, precision_scores_rf, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score_rf, color='r', linestyle='--', label=f'Moyenne = {mean_precision_score_rf:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Précision')
plt.title('Précision en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()
# Rappel
plt.figure(figsize=(10, 6))
plt.plot(range_n_estimators, recall_scores_rf, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score_rf, color='r', linestyle='--', label=f'Moyenne = {mean_recall_score_rf:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('Rappel')
plt.title('Rappel en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()
# F1-score
plt.figure(figsize=(10, 6))
plt.plot(range_n_estimators, f1_scores_rf, marker='o', linestyle='-')
plt.axhline(y=mean_cross_val_score_rf, color='r', linestyle='--', label=f'Moyenne = {mean_f1_score_rf:.2f}')
plt.xlabel('Nombre de voisins')
plt.ylabel('F1-score')
plt.title('F1-score en fonction du nombre de voisins pour K-Nearest Neighbors')
plt.legend(loc='best')
plt.grid(True)
plt.show()

# ----------------------------------------------------- Courbe ROC -----------------------------------------------------
from sklearn.metrics import roc_curve, auc
from sklearn.preprocessing import label_binarize

tab_y_prob_rf = []
for idx, n_estimators in enumerate(range_n_estimators):
    y_prob_rf = tab_rf[idx].predict_proba(X_test_scaled)
    tab_y_prob_rf.append(y_prob_rf)

# Binariser les classes pour chaque classe pour la courbe ROC
y_test_bin = label_binarize(y_test_classes, classes=[0, 1, 2, 3])
n_classes = y_test_bin.shape[1]

# Calculer les courbes ROC et l'AUC pour chaque nombre d'arbres et pour chaque classe
for idx, n_estimators in enumerate(range_n_estimators):
    plt.figure(figsize=(10, 6))
    for i in range(n_classes):
        false_positive_rate, true_positive_rate, _ = roc_curve(y_test_bin[:, i], tab_y_prob_rf[idx][:, i])
        roc_auc = auc(false_positive_rate, true_positive_rate)                      # roc_auc = roc _ area under the curve
        plt.plot(false_positive_rate, true_positive_rate, lw=2, label=f'Classe {i} (AUC = {roc_auc:.2f})')

    plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.xlabel('Taux de Faux Positifs')
    plt.ylabel('Taux de Vrais Positifs')
    plt.title(f'Courbe ROC pour le modèle Random Forest avec {n_estimators} arbres')
    plt.legend(loc='lower right')
    plt.grid(True)
    plt.show()

# Calculer les courbes ROC et l'AUC pour chaque nombre d'arbres
for idx, n_estimators in enumerate(range_n_estimators):
    plt.figure(figsize=(10, 6))
    false_positive_rate, true_positive_rate, _ = roc_curve(y_test_bin[:, i], tab_y_prob_rf[idx][:, i])
    roc_auc = auc(false_positive_rate, true_positive_rate)                      # roc_auc = roc _ area under the curve
    plt.plot(false_positive_rate, true_positive_rate, lw=2, label=f'Classe {i} (AUC = {roc_auc:.2f})')

    plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.xlabel('Taux de Faux Positifs')
    plt.ylabel('Taux de Vrais Positifs')
    plt.title(f'Courbe ROC pour le modèle Random Forest avec {n_estimators} arbres')
    plt.legend(loc='lower right')
    plt.grid(True)
    plt.show()