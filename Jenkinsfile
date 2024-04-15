pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        // DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
        DOCKER_HUB_USERNAME = 'jbobie'
        DOCKER_HUB_PASSWORD = 'dckr_pat_1PIH9PM2EN5qQKwprENIc4SEA6k'
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
        stage('Log in to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
                }
            }
        }
        
        stage('Tag Docker Image') {
            steps {
                script {
                    def dockerImageName = "${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    def taggedImageName = "${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    
                    // Tag the Docker image
                    sh "docker tag ${dockerImageName} ${taggedImageName}"
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    def taggedImageName = "${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    
                    // Push the Docker image to Docker Hub
                    sh "docker push ${taggedImageName}"
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
