# Étape 1 : Utiliser une image Maven pour la construction de l'application
FROM maven:3.8.4-openjdk-11-slim AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers POM et télécharger les dépendances Maven
COPY pom.xml .
# Ajouter un miroir Maven (Maven Central) dans le cas où il y a un problème de connectivité avec les dépôts externes
RUN mvn -Dmaven.repo.local=/app/.m2/repository dependency:go-offline

# Copier le code source et construire l'application
COPY src /app/src
RUN mvn clean package -DskipTests

# Étape 2 : Utiliser une image OpenJDK pour exécuter l'application
FROM openjdk:11-jre-slim

# Définir le répertoire où l'application sera déployée
WORKDIR /app

# Copier le fichier JAR généré à partir de l'étape précédente
COPY --from=build /app/target/*.jar app.jar

# Exposer le port que l'application Spring Boot va utiliser
EXPOSE 5000

# Définir la commande d'exécution pour démarrer l'application
CMD ["java", "-jar", "app.jar"]
