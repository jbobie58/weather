pipeline {
    agent any
    
    environment {
        AWS_REGION = 'your-aws-region'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        EKS_CLUSTER_NAME = 'your-eks-cluster-name'
        DOCKER_REGISTRY_URL = 'your-docker-registry-url'
        DOCKER_IMAGE_NAME = 'your-docker-image-name'
        KUBE_CONFIG = '/tmp/kubeconfig'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-f weather-microservice/Dockerfile .")
                }
            }
        }
        
        // stage('Push Docker Image to Registry') {
        //     steps {
        //         script {
        //             docker.withRegistry("${DOCKER_REGISTRY_URL}", 'docker-registry-credentials-id') {
        //                 docker.image("${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}").push()
        //             }
        //         }
        //     }
        // }
        
    //     stage('Configure Kubernetes') {
    //         steps {
    //             script {
    //                 sh "aws eks --region ${AWS_REGION} update-kubeconfig --name ${EKS_CLUSTER_NAME} --kubeconfig ${KUBE_CONFIG}"
    //             }
    //         }
    //     }
        
    //     stage('Deploy to EKS') {
    //         steps {
    //             script {
    //                 sh "kubectl --kubeconfig ${KUBE_CONFIG} set image deployment/${DEPLOYMENT_NAME} ${CONTAINER_NAME}=${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}"
    //             }
    //         }
    //     }
    // }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
