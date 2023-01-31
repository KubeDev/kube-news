pipeline {
  agent any //quem pode executar
  stages { // Estágios
    stage('Build Docker Image') {
      steps {
        script {
          dockerapp = docker.build("luizpolli/kube-news:v${env.BUILD_ID}", "-f ./src/Dockerfile ./src")
        }
      }
    }
    stage("Push Docker Image") {
      steps {
        script {
          docker.withRegistry("https://registry.hub.docker.com", "dockerhub") {
            dockerapp.push("latest")
            dockerapp.push("v${env.BUILD_ID}")
          }
        }
      }
    }
    stage("Deploy Kube Apply") {
      environment {
        tag_version = "v${env.BUILD_ID}"
      }
      steps {
        script {
          withKubeConfig([credentialsId: "kubeconfig"]) {
            sh "sed -i 's/{{tag}}/$tag_version/g' ./k8s/service.yaml"
            sh 'kubectl apply -f ./k8s/service.yaml'
          }
        }
      }
    }
  }
}