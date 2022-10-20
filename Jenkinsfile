pipeline {
    agent any

    stages {

        stage ('Build Docker Image'){
            steps {
                script {
                    dockerapp = docker.build("miraldo/kube-news:${env.BUILD_ID}", '-f ./Dockerfile .')
                }

            }
        }

        stage('Push docker image'){
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com','cred_dockerhub'){
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                        dockerapp.push('jenkins')
                    }
                }
            }
        }

        stage('Deploy k8s'){
            environment {
                tag_version = "${env.BUILD_ID}"
            }
            steps {
                withKubeConfig ([credentialsId: 'kube_config']) {
                    sh '''
                        kubectl apply -f ./k8s/deployment-postgres.yaml
                        sed -i "s/:latest/:$tag_version/g" ./k8s/deployment-kube-news.yaml
                        kubectl apply -f ./k8s/deployment-kube-news.yaml
                    '''
                }
            }
        }
    }
}