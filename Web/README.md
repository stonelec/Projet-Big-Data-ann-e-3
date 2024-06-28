# Installations

```bash
sudo apt update
sudo apt updgrade

sudo apt install apache2
sudo apt install php libapache2-mod-php

sudo apt install postgresql

sudo apt install python3
sudo apt-get install pip

pip install pandas --break-system-packages
pip install asyncpg --break-system-packages
pip install scikit-learn --break-system-packages

sudo apt install git
```

Donner les droits à l'utilisateur dans le dossier /var/www/html

Dans notre cas, l'utilisitateur est : isen

```bash

sudo chown -R isen .

```

# Technologies utilisés :

Web :
- Html
- Css
- JavaScript
- PHP

Base de donnée :
- Postgresql
- Python

# Arborescence


- `Client/`
    - `css/` : Contient les fichiers CSS.
    - `fonts/` : Contient les fichiers de polices.
    - `images/` : Contient les images utilisées dans le site web.
    - `javascript/` : Contient les fichiers JavaScript.
    - `php/` : Contient les scripts PHP.
    - `___.html` : Différentes pages html.

    - `python/`
        - `fonctionnalite1/` : Contient les .pkl pour la fonctionnalité 1.
        - `fonctionnalite2/` : Contient les .pkl pour la fonctionnalité 2.
        - `fonctionnalite3/` : Contient les .pkl pour la fonctionnalité 3.
        - `script/` : Contient les scripts des différentes fonctionnalités.

    - `SQL/`
        - `data.sql` : Contient les scripts SQL pour la gestion des données.
        - `model.sql` : Contient les scripts SQL pour la création du modèle de base de données.
        - `import_data.py` : Fichier python qui import le fichier Data_Arbres.csv.
        - `Data_Arbres.csv` : Fichier contenant les informations des données.

- `README.md` : Ce fichier de documentation décrivant le projet.