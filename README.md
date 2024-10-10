# 5SPAR

Membres du groupe : Evelina Coquelet, Jean-Baptiste Cherrier

## Analyse des données de Mastodon

Ce projet consiste en une analyse approfondie des données récupérées depuis la plateforme Mastodon. L'objectif principal est d'explorer l'engagement des utilisateurs, la distribution des sentiments dans les publications, et d'extraire des insights pertinents à partir des hashtags utilisés.

Le projet s'appuie sur des technologies de traitement de données distribuées (PySpark), de visualisation (Matplotlib, Seaborn, Squarify, WordCloud), et de stockage (PostgreSQL). Pour garantir une infrastructure flexible et reproductible, Docker est utilisé pour orchestrer différents services tels que Jupyter Notebook, Kafka, Zookeeper, et PostgreSQL.

### Principes de conception

Ce projet utilise le principe de médaillon, qui est un modèle de conception pour la gestion et l'organisation des données. Ce modèle facilite la structuration des données en plusieurs couches, permettant ainsi une séparation claire entre les différentes étapes du traitement et de l'analyse. 

Le médaillon se compose généralement de trois couches :

1. **Bronze (Raw)** : Cette couche contient les données brutes récupérées de Mastodon, sans aucune transformation. Elle sert de source de vérité et permet de conserver l'intégralité des données.

2. **Argent (Processed)** : Dans cette couche, les données brutes sont nettoyées et transformées pour faciliter l'analyse. Cela inclut des opérations comme le filtrage et le nettoyage des données.

3. **Or (Analytics)** : La couche finale, qui contient les données prêtes pour l'analyse et la visualisation. Les données sont agrégées et mises en forme pour répondre aux besoins spécifiques d'analyse, comme l'exploration des sentiments ou la visualisation des hashtags.

### Fonctionnalités principales

- **Exploration des sentiments** : Analyse des publications pour déterminer les catégories de sentiment (positif, négatif, neutre). Cette analyse utilise des techniques de traitement du langage naturel (NLP) pour évaluer le ton des messages et fournir des insights sur la perception des utilisateurs vis-à-vis des sujets discutés.

- **Nuage de mots pour les hashtags** : Extraction et visualisation des hashtags les plus utilisés via un nuage de mots. Cette visualisation permet de mettre en évidence les thèmes dominants dans les publications, en montrant la fréquence des hashtags sous forme graphique. Plus un hashtag est utilisé, plus il est affiché en grand dans le nuage.

- **Analyse de l'engagement des utilisateurs** : Évaluation de l'engagement total et moyen par publication et par utilisateur. Cela inclut des métriques telles que le nombre de likes, de partages et de réponses. Ces analyses permettent d'identifier les utilisateurs les plus engagés et de comprendre comment l'engagement varie selon les types de publications.

- **Visualisation des top hashtags** : Identification des sujets tendances grâce à l'analyse des hashtags les plus fréquents. En utilisant des représentations graphiques comme les treemaps et les nuages de mots, cette fonctionnalité permet de visualiser rapidement les sujets qui captent le plus l'attention sur Mastodon, aidant ainsi à comprendre les discussions et les intérêts de la communauté.

- **Fréquence des Toots** : Analyse de la fréquence de publication des utilisateurs au fil du temps, permettant d'observer les tendances d'activité et d'engagement sur la plateforme. Cela peut révéler des périodes de forte activité ou des événements spécifiques ayant généré plus de publications.

- **Activité des utilisateurs** : Visualisation de l'activité des utilisateurs par date et heure, ce qui permet de déterminer les moments les plus actifs sur la plateforme. Cette analyse aide à comprendre le comportement des utilisateurs et à identifier les périodes d'engagement maximal.

Ces fonctionnalités combinées fournissent une vue d'ensemble complète de l'activité sur Mastodon, permettant d'extraire des insights significatifs.

## Technologies utilisées

Voici un aperçu des principales technologies :

- **Docker** : Utilisé pour l'orchestration des différents services de l'application. Chaque conteneur Docker joue un rôle essentiel dans l'environnement de développement et d'analyse des données. 
  Voici les conteneurs :
  - **Jupyter Notebook** : Fournit un environnement interactif pour écrire et exécuter du code Python, facilitant l'analyse des données et la visualisation.
  - **Kafka** : Gère les flux de données en temps réel, permettant de traiter les publications en continu.
  - **Zookeeper** : Coordonne les services Kafka, assurant leur disponibilité et leur bon fonctionnement.
  - **PostgreSQL** : Base de données relationnelle utilisée pour stocker et gérer les données des publications Mastodon, garantissant la persistance et l'intégrité des données.

- **PySpark** : Permet le traitement des données massives en utilisant une architecture distribuée, optimisant ainsi les performances lors de l'analyse des données volumineuses.

- **Pandas** : Utilisé pour la manipulation et l'analyse des données tabulaires, offrant des fonctionnalités puissantes pour travailler avec des ensembles de données en mémoire.

- **Matplotlib, Seaborn, Squarify, WordCloud** : Bibliothèques de visualisation des données qui permettent de créer des graphiques et des visualisations interactives pour une meilleure compréhension des résultats.

## Installation et exécution

1. Cloner le dépôt :
    ```bash
    git clone https://github.com/Rotabey/5SPAR.git
    ```

2. Modifier le fichier `docker-compose.yml` :
   - Renseigner les variables d'environnement pour PostgreSQL et Jupyter.

3. Lancer les conteneurs Docker :
    ```bash
    docker-compose up -d
    ```

4. Accéder à Jupyter Notebook :
    ```
    http://localhost:8888
    ```

## Créer un compte Mastodon

1. Rendez-vous sur un serveur Mastodon public (https://mastodon.social) afin de vous créer un compte.

2. Obtenir une clé API :
   - Une fois connecté à votre compte Mastodon, allez dans les Préférences/Paramètres de votre compte et allez dans la section Développement.
   - Créez une nouvelle application API. Mastodon fournira une clé d'accès (Access Token) que vous devrez utiliser pour interagir avec l'API.

3. Ajouter la clé API à votre projet :
   - Ouvrez le fichier `mastodon_to_kafka.py`.
   - Ajoutez la clé API dans le fichier sous la variable `access_token`.