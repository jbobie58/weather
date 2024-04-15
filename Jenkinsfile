pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        DOCKER_HUB_USERNAME = credentials('DOCKER_HUB_USERNAME')
        DOCKER_HUB_PASSWORD = credentials('DOCKER_HUB_PASSWORD')
        DOCKER_IMAGE_NAME = 'weather'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerfileDir = "/var/jenkins_home/workspace/weather_main/weather-microservice"
                    def dockerImageName = "${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"
                                        
                    // Build Docker image from the local Dockerfile
                    sh "docker build -t ${dockerImageName} ${dockerfileDir}"
                }
            }
        }
        
        stage('Tag Docker Image') {
            steps {
                script {
                    def dockerImageName = "${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"
                    def taggedImageName = "${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"

                    // Log in to Docker Hub
                    sh "echo ${DOCKER_HUB_PASSWORD} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin"
                    
                    // Tag the Docker image
                    sh "docker tag ${dockerImageName} ${taggedImageName}"
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    def taggedImageName = "${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"
                    
                    // Push the Docker image to Docker Hub
                    sh "docker push ${taggedImageName}"
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
