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

Exemple : python kmeans.py 2 50 170 3