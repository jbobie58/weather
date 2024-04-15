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
                    def dockerfileDir = "/var/jenkins_home/workspace/weather_main/weather-microservice"
                    def dockerImageName = 'weather:0.1'
                    
                    // Build Docker image from the local Dockerfile
                    docker.build("-f ${dockerfileDir}/Dockerfile -t ${dockerImageName} .")
                }
                // script {
                //     // Modify the Docker image name to adhere to naming rules
                //     def dockerImageName = "weather_1.0"
                //     docker.build("-f /var/jenkins_home/workspace/weather_main/weather-microservice/Dockerfile -t ${dockerImageName} .")
                // }
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
