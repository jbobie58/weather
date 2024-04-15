pipeline {
    agent any
    
    stages {
        stage('Testing Stage') {
            steps {
                echo 'This is a testing stage.'
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
