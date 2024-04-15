pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        // DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
        DOCKER_HUB_USERNAME = 'jbobie'
        DOCKER_HUB_PASSWORD = 'J0e58t@me@@'
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
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    def dockerImageName = "${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_USERNAME, DOCKER_HUB_PASSWORD) {
                        // Push the Docker image to Docker Hub
                        docker.image(dockerImageName).push()
                    }
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
