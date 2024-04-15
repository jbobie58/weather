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
                    // Modify the Docker image name to adhere to naming rules
                    def dockerImageName = 'weather'
                    docker.build("-f weather-microservice/Dockerfile -t ${dockerImageName} .")
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
