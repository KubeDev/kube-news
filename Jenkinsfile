pipeline{
    agent{
        label any
    }
    stages{
        stage("Build Docker Image"){
            steps{
                echo "========executing Building Docker Image========"
                script{
                    dockerapp = docker.build("joaomartinelli/kube-news:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
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