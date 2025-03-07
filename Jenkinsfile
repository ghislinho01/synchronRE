pipeline {
    agent any
    environment {
        BACKEND_IMAGE = "backend-image"
    }
    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    // Installer les dépendances Java (Maven)
                    sh 'mvn clean install -DskipTests'
                }
            }
        }
        stage('Build Spring Boot App') {
            steps {
                script {
                    // Compiler l'application Spring Boot (générer le fichier JAR)
                    sh 'mvn clean package -DskipTests'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker pour l'application Backend
                    sh 'docker build -t $BACKEND_IMAGE .'
                }
            }
        }
        stage('Deploy Backend') {
            steps {
                script {
                    // Déployer l'application Backend sur le port 5000
                    sh 'docker run -d -p 5000:5000 --name backend-container $BACKEND_IMAGE'
                }
            }
        }
    }
    post {
        always {
            // Nettoyer les images Docker inutiles après l'exécution
            sh 'docker system prune -f'
        }
    }
}
