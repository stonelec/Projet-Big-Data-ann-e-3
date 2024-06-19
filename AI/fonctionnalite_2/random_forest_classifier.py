# ======================================================================================================================
# ============================================== Préparation des données ===============================================
# ======================================================================================================================
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder

grid_search_mode = 0            # 1 pour activer la recherche par grille, 0 pour désactiver
bdd = 0                         # 1 pour AI_Patrimoine_Arboré_(RO), 0 pour Data_Arbre
num_features = 0                # 2 pour ['tronc_diam', 'haut_tot', 'haut_tronc'], 1 pour 2 + [...,'remarquable','fk_pied'] et 0 pour 2 + [...,'feuillage','fk_revetement']


# Charger la base de données
if bdd == 1:
    data = pd.read_csv('../AI_Patrimoine_Arboré_(RO).csv')

    match num_features:
        case 2:
            features = ['tronc_diam', 'haut_tot', 'haut_tronc']
        case 1:
            features = ['tronc_diam', 'haut_tot', 'haut_tronc', 'remarquable', 'fk_pied']
        case 0:
            features = ['tronc_diam', 'haut_tot', 'haut_tronc', 'feuillage', 'fk_revetement']
else:
    data = pd.read_csv('../Data_Arbre.csv')

    # Créer un encodeur
    label_encoder = LabelEncoder()

    # Appliquer l'encodage
    data['remarquable_encoded'] = label_encoder.fit_transform(data['remarquable'])
    data['fk_pied_encoded'] = label_encoder.fit_transform(data['fk_pied'])
    data['feuillage_encoded'] = label_encoder.fit_transform(data['feuillage'])
    data['fk_revetement_encoded'] = label_encoder.fit_transform(data['fk_revetement'])

    match num_features:
        case 2:
            features = ['tronc_diam', 'haut_tot', 'haut_tronc']
        case 1:
            features = ['tronc_diam', 'haut_tot', 'haut_tronc', 'remarquable_encoded', 'fk_pied_encoded']
        case 0:
            features = ['tronc_diam', 'haut_tot', 'haut_tronc', 'feuillage_encoded', 'fk_revetement_encoded']

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
# ==================================================== Grid Search =====================================================
# ======================================================================================================================
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report

if grid_search_mode == 1:
    # Définir les hyperparamètres à tester
    param_grid_rf = {
        'n_estimators': [50, 100, 200, 300],            # Nombre d'arbres
        'max_depth': [None, 10, 20, 30],                # Profondeur des arbres
        'min_samples_split': [2, 5, 10],                # Échantillons minimum pour diviser un nœud
        'min_samples_leaf': [1, 2, 4],                  # Échantillons minimum pour être à une feuille                                   # distance de Minkowski
    }

    # Créer le modèle K-Nearest Neighbors
    rf = RandomForestClassifier(random_state=42)

    # Configurer GridSearchCV
    grid_search = GridSearchCV(estimator=rf, param_grid=param_grid_rf, scoring='accuracy', n_jobs=-1)
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
    print(classification_report(y_test_classes, y_pred, target_names=['0-10', '10-50', '50-100', '100-200']))


# ======================================================================================================================
# ===================================== Implémentation du modèle Random Forest Classification ==========================
# ======================================================================================================================

match bdd:
    case 1: # AI_Patrimoine_Arboré_(RO)
        match num_features:
            case 2: # ['tronc_diam', 'haut_tot', 'haut_tronc']
            # best-param = {'max_depth': 10, 'min_samples_leaf': 1, 'min_samples_split': 10, 'n_estimators': 100}
                rf = RandomForestClassifier(max_depth=10, min_samples_leaf=1, min_samples_split=10, n_estimators=100, random_state=42)
            case 1: # ['tronc_diam', 'haut_tot', 'haut_tronc', 'remarquable', 'fk_pied']
                # {'max_depth': 20, 'min_samples_leaf': 1, 'min_samples_split': 10, 'n_estimators': 200}
                rf = RandomForestClassifier(max_depth=20, min_samples_leaf=1, min_samples_split=10, n_estimators=200, random_state=42)
            case 0: # ['tronc_diam', 'haut_tot', 'haut_tronc', 'feuillage', 'fk_revetement']
                # {'max_depth': 10, 'min_samples_leaf': 1, 'min_samples_split': 10, 'n_estimators': 100}
                rf = RandomForestClassifier(max_depth=10, min_samples_leaf=1, min_samples_split=10, n_estimators=100, random_state=42)

    case 0: # Data_Arbre
        match num_features:
            case 2:  # ['tronc_diam', 'haut_tot', 'haut_tronc']
                # {'max_depth': 10, 'min_samples_leaf': 1, 'min_samples_split': 5, 'n_estimators': 50}
                rf = RandomForestClassifier(max_depth=10, min_samples_leaf=1, min_samples_split=5, n_estimators=50, random_state=42)
            case 1:  # ['tronc_diam', 'haut_tot', 'haut_tronc', 'remarquable', 'fk_pied']
                # {'max_depth': 20, 'min_samples_leaf': 2, 'min_samples_split': 2, 'n_estimators': 50}
                rf = RandomForestClassifier(max_depth=20, min_samples_leaf=2, min_samples_split=2, n_estimators=50, random_state=42)
            case 0:  # ['tronc_diam', 'haut_tot', 'haut_tronc', 'feuillage', 'fk_revetement']
                # {'max_depth': None, 'min_samples_leaf': 1, 'min_samples_split': 5, 'n_estimators': 300}
                rf = RandomForestClassifier(max_depth=None, min_samples_leaf=1, min_samples_split=5, n_estimators=300, random_state=42)

rf.fit(X_train_scaled, y_train_classes)
pred_rf = rf.predict(X_test_scaled)

# ======================================================================================================================
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

moyenne_scores_rf = scores_rf.mean()
print(f'Moyenne des scores de validation croisée: {moyenne_scores_rf:.4f}')

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
            xticklabels=['0-10', '10-50', '50-100', '100-200'],
            yticklabels=['0-10', '10-50', '50-100', '100-200'])
plt.xlabel('Prédictions')
plt.ylabel('Vérités terrain')
plt.title(f'Matrice de confusion pour Random Forest - score = {accuracy_rf:.2f}')
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
from sklearn.preprocessing import label_binarize

y_prob_rf = rf.predict_proba(X_test_scaled)

# Binariser les classes pour chaque classe pour la courbe ROC
y_test_bin = label_binarize(y_test_classes, classes=[0, 1, 2, 3])
n_classes = y_test_bin.shape[1]

# Calculer les courbes ROC et l'AUC pour chaque nombre d'arbres et pour chaque classe
tab_fpr_rf = []
tab_tpr_rf = []
plt.figure(figsize=(10, 6))
for i in range(n_classes):
    false_positive_rate_mlp, true_positive_rate_mlp, thresholds_mlp = roc_curve(y_test_bin[:, i], y_prob_rf[:, i])
    roc_auc = auc(false_positive_rate_mlp, true_positive_rate_mlp)  # roc_auc = roc _ area under the curve

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
plt.title(f'Courbe ROC pour le modèle Random Forest')
plt.legend(loc='lower right')
plt.grid(True)
plt.show()

print(f'AUC: {roc_auc_global:.4f}')

