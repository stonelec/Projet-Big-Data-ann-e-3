# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
grid_search_mode = 0  # 1 pour activer la recherche par grille, 0 pour désactiver
bdd = 0  # 1 pour AI_Patrimoine_Arboré_(RO), 0 pour Data_Arbre
num_features = 0  # 0 = dimensions + formes | 1 = dimensions


if bdd == 1:
    data = pd.read_csv('../AI_Patrimoine_Arboré_(RO).csv')
    # Sélectionner les caractéristiques
    match num_features:
        case 1:     #dimensions
            features = ['haut_tot', 'haut_tronc', 'tronc_diam']
        case 0      :#dimensions + formes + sol
            features = ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port', 'feuillage']
else:
    data = pd.read_csv('../Data_Arbre.csv')

    # Créer un encodeur
    label_encoder = LabelEncoder()

    # Appliquer l'encodage
    data['fk_port_encoded'] = label_encoder.fit_transform(data['fk_port'])
    data['feuillage_encoded'] = label_encoder.fit_transform(data['feuillage'])

    match num_features:
        case 1:      #dimensions
            features = ['haut_tot', 'haut_tronc', 'tronc_diam']
        case 0      :#dimensions + formes + sol
            features = ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port_encoded', 'feuillage_encoded']
target = 'fk_arb_etat'


# Filtrer les colonnes pertinentes
X = data[features]
Y = data[target]

# Diviser les données en ensembles d'entraînement et de test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=42)


# ======================================================================================================================
# ============================================= Encodage des classes d'âge =============================================
# ======================================================================================================================
import numpy as np


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
from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report

if grid_search_mode == 1:
    # Définir les hyperparamètres à tester
    param_grid_melp = {
        'hidden_layer_sizes': [(50,), (100,), (50, 50), (100, 50, 25)],  # Combinaisons de tailles de couches cachées
        'activation': ['logistic', 'tanh', 'relu'],  # Fonctions d'activation à tester
        'solver': ['sgd', 'adam'],  # Algorithmes d'optimisation
        'max_iter': [500, 1000, 2000],  # Nombre d'itérations
        'early_stopping': [True]  # Utilisation de l'arrêt anticipé
    }

    # Créer le modèle K-Nearest Neighbors
    mlp = MLPClassifier(random_state=42)

    # Configurer GridSearchCV
    grid_search = GridSearchCV(estimator=mlp, param_grid=param_grid_melp, scoring='accuracy', n_jobs=-1)
    # n_jobs = -1 means using all processors

    # Exécuter la recherche par grille
    grid_search.fit(X_train_scaled, y_train_classes)

    # Afficher les meilleurs hyperparamètres
    print("Meilleurs hyperparamètres trouvés par GridSearchCV :")
    print(grid_search.best_params_)

    best_knn = grid_search.best_estimator_
    y_pred = best_knn.predict(X_test_scaled)

    # Évaluation des performances
    print("Classification Report:")
    print(classification_report(y_test_classes, y_pred, target_names=['0', '1']))
    print("")
    print("")


# ======================================================================================================================
# ======================================== Implémentation du modèle Multi Layer Perceptron =============================
# ======================================================================================================================

match bdd:
    case 1:  # AI_Patrimoine_Arboré_(RO)
        match num_features:
            case 2:  # ['tronc_diam', 'haut_tot', 'haut_tronc']
                # best-param = {'activation': 'relu', 'early_stopping': True, 'hidden_layer_sizes': (50, 50), 'max_iter': 500, 'solver': 'adam'}
                mlp = MLPClassifier(activation='relu', early_stopping=True, hidden_layer_sizes=(50, 50), max_iter=500, solver='adam', random_state=42)
            case 1:  # ['tronc_diam', 'haut_tot', 'haut_tronc', 'remarquable', 'fk_pied']
                # {'activation': 'relu', 'early_stopping': True, 'hidden_layer_sizes': (100, 50, 25), 'max_iter': 500, 'solver': 'adam'}
                mlp = MLPClassifier(activation='relu', early_stopping=True, hidden_layer_sizes=(100, 50, 25), max_iter=500, solver='adam', random_state=42)
            case 0:  # ['tronc_diam', 'haut_tot', 'haut_tronc', 'feuillage', 'fk_revetement']
                # {'activation': 'relu', 'early_stopping': True, 'hidden_layer_sizes': (50, 50), 'max_iter': 500, 'solver': 'adam'}
                mlp = MLPClassifier(activation='relu', early_stopping=True, hidden_layer_sizes=(50, 50), max_iter=500, solver='adam', random_state=42)


    case 0:  # Data_Arbre
        match num_features:
            case 2:  # ['tronc_diam', 'haut_tot', 'haut_tronc']
                #
                mlp = MLPClassifier(random_state=42)
            case 1:  # ['tronc_diam', 'haut_tot', 'haut_tronc', 'remarquable', 'fk_pied']
                #
                mlp = MLPClassifier(random_state=42)
            case 0:  # ['tronc_diam', 'haut_tot', 'haut_tronc', 'feuillage', 'fk_revetement']
                #
                mlp = MLPClassifier(random_state=42)


mlp.fit(X_train_scaled, y_train_classes)
pred_mlp = mlp.predict(X_test_scaled)


# ======================================================================================================================
# ============================================ Évaluation et visualisation =============================================
# ======================================================================================================================
import matplotlib.pyplot as plt
# ------------------------------------------------------ Précision -----------------------------------------------------
from sklearn.metrics import accuracy_score

accuracy_mlp = accuracy_score(y_test_classes, pred_mlp)  # Calculer le score de précision et l'ajouter à la liste

print(f'Accuracy: {accuracy_mlp:.4f}')

# ------------------------------------------------- Validation croisée -------------------------------------------------
from sklearn.model_selection import cross_val_score

scores_mlp = cross_val_score(mlp, X_train_scaled, y_train_classes, cv=5, scoring='accuracy')   # Calculer le score de validation croisée avec 5 valeurs croisées

print(f'Score de validation croisée: {scores_mlp}')

# -------------------------------------------- RMSE -----------------------------------------------------------
from sklearn.metrics import mean_squared_error

rmse_mlp = np.sqrt(mean_squared_error(y_test_classes, pred_mlp))

print(f'RMSE: {rmse_mlp:.4f}')

# ------------------------------------------------- Matrice de confusion -----------------------------------------------
from sklearn.metrics import confusion_matrix
import seaborn as sns

conf_matrix_mlp = confusion_matrix(y_test_classes, pred_mlp)

print('Matrice de confusion pour Multi Layer Perceptron')
print(conf_matrix_mlp)

plt.figure(figsize=(10, 6))
sns.heatmap(conf_matrix_mlp, annot=True, fmt='d', cmap='Blues',
            xticklabels=['0', '1'],
            yticklabels=['0', '1'])
plt.xlabel('Prédictions')
plt.ylabel('Vérités terrain')
plt.title(f'Matrice de confusion pour Multi Layer Perceptron - score = {accuracy_mlp:.2f}')
plt.show()


# ------------------------------------------------- Précision et Rappel ------------------------------------------------
from sklearn.metrics import precision_score, recall_score, f1_score

# Évaluer la précision et le rappel pour chaque nombre de voisins

precision_mlp = precision_score(y_test_classes, pred_mlp, average='weighted', zero_division=1)          # Calcul de la précision moyenne pondérée

recall_mlp = recall_score(y_test_classes, pred_mlp, average='weighted', zero_division=1)                # Calcul du rappel moyen pondéré

f1_mlp = f1_score(y_test_classes, pred_mlp, average='weighted', zero_division=1)                        # Calcul du f1_score

print(f'Précision: {precision_mlp:.4f}, Rappel: {recall_mlp:.4f}, F1-Score: {f1_mlp:.4f}')

# ----------------------------------------------------- Courbe ROC -----------------------------------------------------
from sklearn.metrics import roc_curve, auc
from sklearn.preprocessing import label_binarize

y_prob_mlp = mlp.predict_proba(X_test_scaled)

# Binariser les classes pour chaque classe pour la courbe ROC
y_test_bin = label_binarize(y_test_classes, classes=[0, 1])
n_classes = y_test_bin.shape[1]

# Calculer les courbes ROC et l'AUC pour chaque nombre d'arbres et pour chaque classe
tab_fpr_rf = []
tab_tpr_rf = []
plt.figure(figsize=(10, 6))
for i in range(n_classes):
    false_positive_rate_mlp, true_positive_rate_mlp, thresholds_mlp = roc_curve(y_test_bin[:, i], y_prob_mlp[:, i])
    roc_auc = auc(false_positive_rate_mlp, true_positive_rate_mlp)     # roc_auc = roc _ area under the curve

    tab_fpr_rf.append(false_positive_rate_mlp)
    tab_tpr_rf.append(true_positive_rate_mlp)

# Combiner les courbes ROC pour une courbe globale
fpr_global = np.unique(np.concatenate(tab_fpr_rf))
tpr_global = np.zeros_like(fpr_global)

for fpr_i, tpr_i in zip(tab_fpr_rf, tab_tpr_rf):
    tpr_global += np.interp(fpr_global, fpr_i, tpr_i)

tpr_global /= n_classes  # Moyenne des vrais positifs pour chaque taux de faux positifs

roc_auc_global = auc(fpr_global, tpr_global)

# Affichage de la courbe ROC pour chaque quantité d'arbres
plt.plot(fpr_global, tpr_global, color='b', lw=2, label=f'ROC (AUC = {roc_auc_global:.2f})')
plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('Taux de Faux Positifs')
plt.ylabel('Taux de Vrais Positifs')
plt.title(f'Courbe ROC pour le modèle Multi-Layer-Perceptron')
plt.legend(loc='lower right')
plt.grid(True)
plt.show()

print(f'AUC: {roc_auc_global:.4f}')
