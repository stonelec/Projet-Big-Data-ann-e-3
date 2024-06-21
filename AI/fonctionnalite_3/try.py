# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
pd.set_option("future.no_silent_downcasting", True)
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
import numpy as np
import sys

grid_search_mode = 0  # 1 pour activer la recherche par grille, 0 pour désactiver
bdd = 0  # 1 pour AI_Patrimoine_Arboré_(RO), 0 pour Data_Arbre
algo = 2  # 0 pour Random Forest | 1 pour Multi Layer Perceptron | 2 pour K-Nearest Neighbors
num_features = 2  # Nombre de caractéristiques à utiliser


if bdd == 1:
    data = pd.read_csv('../AI_Patrimoine_Arboré_(RO).csv')

    # Sélectionner les caractéristiques
    match num_features:
        case 0:
            features = ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port', 'feuillage', 'fk_pied', 'fk_revetement']
        case 1:
            features = ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port', 'feuillage']
        case 2:
            features = ['haut_tot', 'haut_tronc', 'tronc_diam']
else:
    data = pd.read_csv('../Data_Arbre.csv')

    # Créer un encodeur
    label_encoder = LabelEncoder()

    # Appliquer l'encodage
    data['fk_port_encoded'] = label_encoder.fit_transform(data['fk_port'])
    data['feuillage_encoded'] = label_encoder.fit_transform(data['feuillage'])
    data['fk_pied_encoded'] = label_encoder.fit_transform(data['fk_pied'])
    data['fk_revetement_encoded'] = label_encoder.fit_transform(data['fk_revetement'])

    match num_features:
        case 0:
            features = ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port_encoded', 'feuillage_encoded', 'fk_pied_encoded', 'fk_revetement_encoded']
        case 1:
            features = ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port_encoded', 'feuillage_encoded']
        case 2:
            features = ['haut_tot', 'haut_tronc', 'tronc_diam']

target = 'fk_arb_etat'

# Filtrer les colonnes pertinentes
X = data[features]
Y = data[target]
# Diviser les données en ensembles d'entraînement et de test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=42)

# ======================================================================================================================
# ============================================= Encodage des classes etat =============================================
# ======================================================================================================================
# Définir les classes etat
def etat_class(etat):
    if bdd == 1:
        if etat == 3 or etat == 4:
            return 1
        else:
            return 0
    else:
        if etat == 'Essouché' or etat == 'Non essouché':
            return 1
        else:
            return 0


# Appliquer la fonction pour créer des labels
y_train_classes = np.array([etat_class(etat) for etat in Y_train])
y_test_classes = np.array([etat_class(etat) for etat in Y_test])
# ======================================================================================================================
# ============================================ Normalisation des données ==============================================
# ======================================================================================================================
from sklearn.preprocessing import StandardScaler

# Standardiser les données
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)


# ======================================================================================================================
# ==================================================== Grid Search =====================================================
# ======================================================================================================================
from sklearn.ensemble import RandomForestClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report

best_rf = None

if grid_search_mode == 1:
    # Définir les hyperparamètres à tester
    match algo:
        case 0:
            param_grid = {
                'n_estimators': [50, 100, 200],
                'max_depth': [None, 10, 20],
                'min_samples_split': [2, 5, 10],
                'min_samples_leaf': [1, 2, 4],
                'bootstrap': [True, False]
            }
        case 1:
            param_grid = {
                'hidden_layer_sizes': [(50,), (100,), (50, 50)],
                'activation': ['relu', 'tanh'],
                'solver': ['adam', 'lbfgs'],
                'alpha': [0.0001, 0.001, 0.01],
                'learning_rate': ['constant', 'invscaling', 'adaptive']
            }
        case 2:
            param_grid = {
                'n_neighbors': [3, 5, 7],
                'weights': ['uniform', 'distance'],
                'algorithm': ['auto', 'ball_tree', 'kd_tree']
            }

    if algo == 0:
        print("Random Forest")
        # Créer le modèle K-Nearest Neighbors
        rf = RandomForestClassifier(random_state=42)
    elif algo == 1:
        print("Multi Layer Perceptron")
        # Créer le modèle Multi Layer Perceptron
        rf = MLPClassifier(random_state=42)
    elif algo == 2:
        print("K-Nearest Neighbors")
        # Créer le modèle K-Nearest Neighbors
        rf = KNeighborsClassifier()
    # Configurer GridSearchCV
    grid_search = GridSearchCV(estimator=rf, param_grid=param_grid, scoring='accuracy', n_jobs=-1)
    # n_jobs = -1 means using all processors

    # Exécuter la recherche par grille
    grid_search.fit(X_train_scaled, y_train_classes)

    # Afficher les meilleurs hyperparamètres
    print("Meilleurs hyperparamètres trouvés par GridSearchCV :")
    print(grid_search.best_params_)

    best_rf = grid_search.best_estimator_
    y_pred = best_rf.predict(X_test_scaled)

    # Évaluation des performances
    print("Classification Report:")
    print(classification_report(y_test_classes, y_pred, target_names=['1', '0']))
    print("")
    print("")



# ======================================================================================================================
# ===================================== Implémentation du modèle Random Forest Classification ==========================
# ======================================================================================================================

match bdd:
    case 1:  # AI_Patrimoine_Arboré_(RO)
        match algo:
            case 0:
                rf = best_rf if best_rf else RandomForestClassifier()
            case 1:
                rf = best_rf if best_rf else MLPClassifier(max_iter=1000, random_state=42)
            case 2:
                rf = best_rf if best_rf else KNeighborsClassifier(n_neighbors=5)
    case 0:  # Data_Arbre
        match algo:
            case 0:
                rf = best_rf if best_rf else RandomForestClassifier()
            case 1:
                rf = best_rf if best_rf else MLPClassifier(max_iter=1000, random_state=42)
            case 2:
                rf = best_rf if best_rf else KNeighborsClassifier(n_neighbors=5)
rf.fit(X_train_scaled, y_train_classes)
pred_rf = rf.predict(X_test_scaled)

import pickle
# Sauvegardez le modèle dans un fichie
match algo:
    case 0:
        with open('f3_random_forest.pkl', 'wb') as fichier:
            pickle.dump(rf, fichier)
    case 1:
        with open('f3_multilayer_perceptron.pkl', 'wb') as fichier:
            pickle.dump(rf, fichier)
    case 2:
        with open('f3_k_nearest_neighbors.pkl', 'wb') as fichier:
            pickle.dump(rf, fichier)
# =============================-=========================================================================================
# ============================================ Évaluation et visualisation =============================================
# ======================================================================================================================
import matplotlib.pyplot as plt
# ------------------------------------------------------ Précision -----------------------------------------------------
from sklearn.metrics import accuracy_score

accuracy_rf = accuracy_score(y_test_classes, pred_rf)  # Calculer le score de précision et l'ajouter à la liste

print(f'Accuracy: {accuracy_rf:.4f}')

# ------------------------------------------------- Validation croisée -------------------------------------------------
from sklearn.model_selection import cross_val_score

scores_rf = cross_val_score(rf, X_train_scaled, y_train_classes, cv=5, scoring='accuracy')  # Calculer le score de validation croisée avec 5 valeurs croisées

print(f'Score de validation croisée: {scores_rf}')

# -------------------------------------------------------- RMSE --------------------------------------------------------
from sklearn.metrics import mean_squared_error

rmse_rf = np.sqrt(mean_squared_error(y_test_classes, pred_rf))

print(f'RMSE: {rmse_rf:.4f}')

# ------------------------------------------------- Matrice de confusion -----------------------------------------------
from sklearn.metrics import confusion_matrix
import seaborn as sns

conf_matrix_rf = confusion_matrix(y_test_classes, pred_rf)

print('Matrice de confusion pour Multi Layer Perceptron')
print(conf_matrix_rf)

plt.figure(figsize=(10, 6))
sns.heatmap(conf_matrix_rf, annot=True, fmt='d', cmap='Blues',
            xticklabels=['0', '1'],
            yticklabels=['0', '1'])
plt.xlabel('Prédictions')
plt.ylabel('Vérités terrain')
match algo:
    case 0:
        plt.title(f'Matrice de confusion pour Random Forest - score = {accuracy_rf:.2f}')
    case 1:
        plt.title(f'Matrice de confusion pour Multi Layer Perceptron - score = {accuracy_rf:.2f}')
    case 2:
        plt.title(f'Matrice de confusion pour K-Nearest Neighbors - score = {accuracy_rf:.2f}')
plt.show()



# ------------------------------------------------- Précision et Rappel ------------------------------------------------
from sklearn.metrics import precision_score, recall_score, f1_score

# Évaluer la précision et le rappel pour chaque nombre de voisins

precision_rf = precision_score(y_test_classes, pred_rf, average='weighted', zero_division=1)  # Calcul de la précision moyenne pondérée

recall_rf = recall_score(y_test_classes, pred_rf, average='weighted', zero_division=1)  # Calcul du rappel moyen pondéré

f1_rf = f1_score(y_test_classes, pred_rf, average='weighted', zero_division=1)  # Calcul du f1_score

print(f'Précision: {precision_rf:.4f}, Rappel: {recall_rf:.4f}, F1-Score: {f1_rf:.4f}')

# ----------------------------------------------------- Courbe ROC -----------------------------------------------------
from sklearn.metrics import roc_curve, auc
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import label_binarize

# Prédire les probabilités avec le modèle Random Forest
y_prob_rf = rf.predict_proba(X_test_scaled)[:, 1]  # Probabilité pour la classe positive

# Calculer la courbe ROC et l'AUC
fpr, tpr, thresholds = roc_curve(y_test_classes, y_prob_rf)
roc_auc = auc(fpr, tpr)

# Affichage de la courbe ROC
plt.figure(figsize=(10, 6))
plt.plot(fpr, tpr, color='b', lw=2, label=f'ROC (AUC = {roc_auc:.2f})')
plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('Taux de Faux Positifs')
plt.ylabel('Taux de Vrais Positifs')
match algo:
    case 0:
        plt.title('Courbe ROC pour le modèle Random Forest')
    case 1:
        plt.title('Courbe ROC pour le modèle Multi Layer Perceptron')
    case 2:
        plt.title('Courbe ROC pour le modèle K-Nearest Neighbors')
plt.legend(loc='lower right')
plt.grid(True)
plt.show()

print(f'AUC: {roc_auc:.4f}')
