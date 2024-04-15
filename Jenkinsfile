pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        // DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
        DOCKER_IMAGE_NAME = 'weather'
        DOCKER_IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Testing Stage') {
            steps {
                echo 'This is a testing stage.'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerfileDir = "/var/jenkins_home/workspace/weather_main/weather-microservice"
                    def dockerImageName = "${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    
                    // Build Docker image from the local Dockerfile
                    sh "docker build -t ${dockerImageName} ${dockerfileDir}"
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
