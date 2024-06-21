# Fonctionnalité 1 :

## Taille des arbres :

Tout d'abord, nous avons affiché les clusters sur une map (avec 2 clusters et 3 clusters) qui vont nous permettre de mieux visualiser.

Ensuite, nous avons fait un menu qui vous permet de choisir ce que vous voulez afficher, c'est-à-dire choisir :

- Les données
- La méthode d'apprentissage
- La métrique
- Le nombre de clusters

À la fin, vous aurez le score de ce que vous avez choisi, ainsi qu'un graphique qui représente le score de 2 à 30 clusters pour une meilleure visualisation, avec la moyenne des scores.

## Script :

Pour le script, vous allez pouvoir mettre en entrée les données que vous souhaitez pour connaître le cluster de l'arbre.
Il faut mettre les données dans cet ordre :

- 1er : haut_tronc
- 2ᵉ : age_estim
- 3ᵉ : tronc_diam
- 4ᵉ : le nombre de clusters

Exemple : python fonc1.py 2 50 170 3

Attention, pour pouvoir utiliser le script, il faut faire une fois le menu avec la méthode kmeans.
Le script ne marche qu'avec la méthode kmeans.

# Fonctionnalité 2 :

## Age des arbres :

Pour chacun des modèles, répartis dans 3 fichiers différents, nous avons fait un menu qui vous permet de choisir :

- L'utilisation ou  non du Grid Search
- La base de données à utiliser
- Les features d'entrées du modèle

L'optimisation des hyperparamètres est faite avec le Grid Search et est utilisée dans chacun des deux derniers choix.

Pour avoir les résultats optimaux, veuillez choisir la base de données "data.csv" (option 0) et le jeu de features numéro 0.

Il vous sera affiché dans la console l'accuracy du modèle, le score de validation croisée, la RMSE, la matrice de confusion, la précision, le rappel et le f1-score et l'AUC.

De plus, vous aurez la matrice de confusion et un graphique qui représente la courbe ROC.

## Script :

Pour le script, vous allez pouvoir mettre en entrée les données que vous souhaitez pour connaître l'âge de l'arbre.
Il faut mettre les données dans cet ordre :

- 1er : tronc_diam
- 2ᵉ : haut_tot
- 3ᵉ : haut_tronc
- 4ᵉ : feuillage
- 5ᵉ : fk_revetement
- 6ᵉ : méthode d'apprentissage (rf, knn ou mlp)

Exemple : python fonc2.py 5 20 10 0 1 rf

# Fonctionnalité 3 :

## Taille des arbres :

Tout d'abord, nous avons affiché les clusters sur une map (avec 2 clusters et 3 clusters) qui vont nous permettre de mieux visualiser.

Ensuite, nous avons fait un menu qui vous permet de choisir ce que vous voulez afficher, c'est-à-dire choisir :

- Les données
- La méthode d'apprentissage
- La métrique
- Le nombre de clusters

À la fin, vous aurez le score de ce que vous avez choisi, ainsi qu'un graphique qui représente le score de 2 à 30 clusters pour une meilleure visualisation, avec la moyenne des scores.

## Script :

Pour le script, vous allez pouvoir mettre en entrée les données que vous souhaitez savoir si l'arbre résistera ou non à la tempête.
Il faut mettre les données dans cet ordre :

- 1er : haut_tot
- 2ᵉ : haut_tronc
- 3ᵉ : tronc_diam
- 4ᵉ : fk_port
- 5ᵉ : feuillage
- 6ᵉ : fk_pied
- 7ᵉ : fk_revetement
- 8ᵉ : méthode d'apprentissage

Exemple : python fonc3.py 5 20 10 0 1 1 rf