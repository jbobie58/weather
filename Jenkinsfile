pipeline {
    agent any
    
    stages {
        stage('Testing Stage') {
            steps {
                echo 'This is a testing stage.'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-f weather-microservice/Dockerfile .")
                }
            }
        }
    }
    
    post {
        success {
            echo 'Testing pipeline succeeded!'
        }
        failure {
            echo 'Testing pipeline failed!'
        }
    }
}
