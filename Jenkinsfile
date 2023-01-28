pipeline{
    agent any
    stages{
        stage("Build Docker Image"){
            
            steps{
                script{
                    echo "========executing Building Docker Image========"
                    dockerapp = docker.build("joaomartinelli/kube-news:${env.BUILD_ID}", '-f ./src/dockerfile ./src')
                }
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage("Post Docker Image"){
            steps{
                script{
                    echo "========executing Posting Docker Image========"
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                        }
                }

            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
         stage("Deploy Kubernetes"){
            
            enviroment{
                tag_version = "${env.BUILD_ID}"
            }
            
            steps{
                script{
                    echo "========Deploying Kubernetes========"
                    withKubeConfig([credentialsId: 'kube']){
                        sh 'sed -i "s/{{TAG}}/$tag_version/g" k8s/deployment.yaml'
                        sh 'kubectl apply -f k8s/deployment.yaml'
                        }
                }

            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }

    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}