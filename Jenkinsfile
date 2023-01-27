pipeline {
    agent any

    stages {

        stage ('Install dependencies') {
            steps {
                sh 'cd ./src && npm install'
            }
        }

        stage ('Build Docker Image') {
            steps {
                script {
                    dockerapp = docker.build("matheussenra/kubenews:${env.BUILD_ID}", '-f ./src/DockerFile ./src')
                }
            }
        }

        stage ('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

        stage ('Deploy Kubernetes') {
            environment {
                tag_version = "${env.BUILD_ID}"
            }
            steps {
                withKubeConfig([credentialsId: 'kubeconfig']) {
                    sh 'sed -i "s/{{TAG}}/$tag_version/g" ./k8s/deployment.yaml'
                    sh 'kubectl apply -f ./k8s/deployment.yaml'
                }
            }

        }
    }

}
