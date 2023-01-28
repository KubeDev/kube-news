pipeline{
    agent{
        label any
    }
    stages{
        stage("Build Docker Image"){
            echo "========executing Building Docker Image========"
            steps{
                
                script{
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