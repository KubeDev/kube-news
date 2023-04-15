pipeline {
    agent any

    stages {
        stage ('Build Doker Image') {
            steps {
                dockerapp = docker.build("audaliodevops/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
            }
        }
    }
}