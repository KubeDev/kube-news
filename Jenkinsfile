pipeline {
    agent any

    stages {

        stage ('Build Doker Image') {
            steps {
                script {
                    dockerapp = docker.build("audalio-devops/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
        }
    }
}