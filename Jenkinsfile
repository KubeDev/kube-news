pipeline{
    agent any

    stages{

        stage ('Build Docker Image')
            steps{
                scripts{
                    dockerapp = docker.build("diegosanchomagalhaes/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
    }

}