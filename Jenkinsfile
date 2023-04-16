pipeline {
    agent any

    stages {

        // Primeiro stage de  build
        stage ('Build Docker Image') {
            steps: {
                script {
                    // parametrizar - toda vez que executar a pipeline mudar a tag, incrementando
                    dockerapp = docker.build("ilaraca/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
        }
    }
}