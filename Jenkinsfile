pipeline {
    agent any

    stages{
        stage("Build Docker Image") {
            steps {
                script {
                    dockerapp = docker.build("davidwesleydev/kube-news:${env.BUILD_ID}", "-f ./src/Dockerfile ./src")
                }
            }
        }
        
        stage ('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}") 
                    }
                }
            }
        }

        stage('Deploy Kubernetes') {
            environment {
                tag_version = "${env.BUILD_ID}"
            }
            steps {
                withKubeConfig([credentialsId: 'kubeconfig']) {
                    sh 'kubectl apply -f ./k8s/deployment-db.yml' 
                    sh 'sed -i "s/{{TAG_VERSION}}/$tag_version/g" ./k8s/deployment-web.yml'
                    sh 'kubectl apply -f ./k8s/deployment-web.yml' 
                }
            }
        }
    }
}