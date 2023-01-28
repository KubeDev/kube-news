pipeline{
    agent any
    stages{
        stage("Build Docker Image"){
            
            steps{
                script{
                    echo "========executing Building Docker Image========"
                    dockerapp = docker.build("joaomartinelli/kube-news:v1", '-f ./src/dockerfile ./src')
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