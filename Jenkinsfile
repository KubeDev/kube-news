pipeline {
    agent any

    stages {
        stage ('Build Doker Image') {
            steps {
                dockerapp = docker.build("audalio-devops/kube-news:v1", '-f ./src/Dockerfile ./src')
            }
        }
    }
}