pipeline{
    agent any

    stages {
        stage ('Build Image') {
            steps {
                script {
                    dockerapp = docker.build("fabricioveronez/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src') 
                }                
            }
        }
    }

}