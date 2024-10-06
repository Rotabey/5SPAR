FROM jupyter/pyspark-notebook:latest

# Passer à l'utilisateur root pour exécuter des commandes avec des privilèges élevés
USER root

# Mettre à jour les paquets et installer wget
RUN apt-get update && apt-get install -y wget

RUN apt-get install fonts-noto-cjk

# Donner les permissions appropriées au répertoire des jars Spark
RUN mkdir -p /usr/local/spark/jars && chmod -R 777 /usr/local/spark/jars

# Copier le fichier de dépendances
COPY requirements.txt /home/jovyan/work/requirements.txt

# Copier le JAR du connecteur PostgreSQL
COPY postgresql-42.2.18.jar /usr/local/spark/jars/postgresql-42.2.18.jar

# Télécharger le connecteur Kafka pour Spark
RUN wget -P /usr/local/spark/jars https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.1.2/spark-sql-kafka-0-10_2.12-3.1.2.jar

# Télécharger le client Kafka
RUN wget -P /usr/local/spark/jars https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/2.8.0/kafka-clients-2.8.0.jar

# Revenir à l'utilisateur jovyan pour les étapes suivantes
USER jovyan

# Changer le répertoire de travail
WORKDIR /home/jovyan/work/

# Installer les dépendances Python
RUN pip install -r /home/jovyan/work/requirements.txt