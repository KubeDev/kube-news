pipeline {
    agent any
    stages {
        stage('Build Docker Image')
            steps {
                script {
                    dockerapp = docker.build("thainablaschek/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
            stage('Push Docker Image') {
                steps {
                    script {
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub')
                    dockerapp.push('lastest')
                    dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }

            stage('Deploy Kubernetes') {
                enviroment {
                    tag_version = "${env.BUILD_ID}"
                }
                steps {
                withKubeconfig([credentialsId : 'kubeconfig]'){
                    sh 'sed - "s/{{TAG}}/$tag_version/g" ./k8s/deployment.yaml'
                   sh 'kubectl apply -f ./k8s/Deployment.yaml'
                }
                }
            }
    }
}
