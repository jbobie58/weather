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
                    def dockerImageName = "weather_1.0"
                    docker.build("-f /var/jenkins_home/workspace/weather_main/weather-microservice/Dockerfile -t ${dockerImageName} .")
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
