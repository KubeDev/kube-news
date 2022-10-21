pipeline {
    agent any

    stages {
        stage ('Build docker image'){
            steps {
                script{
                    dockerapp = docker.build("dropecosta/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
        }

        stage ('Push Docker image'){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

        stage ('Deploy Kubernetes'){
            environment{
                tag_version = "${env.BUILD_ID}"
            }
            steps{
                withKubeConfig ([credentialsId: 'kubeconfig']){
                    sh 'sed -i "s/{{TAG}}/$tag_version/g" ./k8s/deployment.yaml'
                    sh 'kubectl apply -f ./k8s/deployment.yaml'
                }
            }

        }
    }
}