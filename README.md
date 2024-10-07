# 5SPAR
## Analyse des Données de Mastodon

Ce projet consiste en une analyse approfondie des données récupérées depuis la plateforme Mastodon. L'objectif principal est d'explorer l'engagement des utilisateurs, la distribution des sentiments dans les publications, et d'extraire des insights pertinents à partir des hashtags utilisés.

Le projet s'appuie sur des technologies de traitement de données distribuées (PySpark), de visualisation (Matplotlib, Seaborn), et de stockage (PostgreSQL). Pour garantir une infrastructure flexible et reproductible, Docker est utilisé pour orchestrer différents services tels que Jupyter Notebook, Kafka, Zookeeper, et PostgreSQL.
Fonctionnalités principales :
- Exploration des sentiments : Analyse des catégories de sentiment (positif, négatif, neutre) dans les publications.
- Nuage de mots pour les hashtags : Extraction et visualisation des hashtags les plus utilisés via un nuage de mots.
- Analyse de l'engagement des utilisateurs : Distribution et visualisation de l'engagement total et moyen par publication et par utilisateur.
- Visualisation des top hashtags : Identification des sujets tendances via l'analyse des hashtags les plus fréquents.

## Architecture Docker :

Ce projet repose sur plusieurs conteneurs Docker, chacun jouant un rôle essentiel dans l'environnement de développement et d'analyse des données.

Rôles des conteneurs :
- Jupyter Notebook : Fournit un environnement interactif pour écrire et exécuter du code Python, facilitant l'analyse des données et la visualisation.
- Kafka : Assure la gestion des flux de données en temps réel, facilitant la collecte et le traitement des publications provenant de Mastodon.
- Zookeeper : Coordonne les services Kafka et garantit leur disponibilité.
- PostgreSQL : Base de données relationnelle utilisée pour stocker les données des publications Mastodon.

Création d'un compte Mastodon et obtention de la clé API

Pour récupérer des données depuis Mastodon, vous devez créer un compte et obtenir une clé API afin de pouvoir accéder à l'API Mastodon. Voici les étapes à suivre :

## Installation et exécution

Cloner le dépôt :

```bash
git clone https://github.com/Rotabey/5SPAR.git
```

Lancer les conteneurs Docker :

```bash
docker-compose up -d
```

Accéder à Jupyter Notebook :
```
    http://localhost:8888
```

## Technologies utilisées :
- Docker : Pour l'orchestration des différents services de l'application.
- PySpark : Traitement des données massives.
- Pandas : Manipulation et analyse de données tabulaires.
- Matplotlib et Seaborn : Visualisation des données.
- WordCloud : Génération de nuages de mots à partir des hashtags.
- PostgreSQL : Base de données pour le stockage des données Mastodon.
- Kafka et Zookeeper : Gestion des flux de données en temps réel.

## Créer un compte Mastodon :
Rendez-vous sur un serveur Mastodon public (https://mastodon.social) aafin de vous créer un compte.

Obtenir une clé API :
- Une fois connecté à votre compte Mastodon, allez dans les Préférences/Paramètres de votre compte et allez dans la section Développement.
- Créez une nouvelle application API. Mastodon fournira une clé d'accès (Access Token) que vous devrez utiliser pour interagir avec l'API.

Ajouter la clé API à votre projet :
- Ouvrez le fichier mastodon_to_kafka.py.
- Ajoutez la clé API dans le fichier sous la variable access_token.