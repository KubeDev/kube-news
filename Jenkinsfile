pipeline {
  agent any //quem pode executar
  stages { // Estágios
    stage('Build Docker Image') {
      steps {
        script {
          dockerapp = docker.build("luizpolli/kube-news:${env.BUILD_ID}", "-f ./src/Dockerfile ./src")
        }
      }
    }
  }
}