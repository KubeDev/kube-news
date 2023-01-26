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
    stage("Push Docker Image") {
      steps {
        script {
          docker.withRegistry("https://registry.hub.docker.com", "dockerhub") {
            dockerapp.Push("latest")
            dockerapp.Push("${env.BUILD_ID}")
          }
        }
      }
    }
  }
}