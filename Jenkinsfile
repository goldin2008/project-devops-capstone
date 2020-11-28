pipeline {
    environment{
        registry = "goldin2008/devops-capstone"
        registryCredential = 'docker-hub' 
        greenDockerImage = '' 
        blueDockerImage = ''
    }
    agent any 
    stages {
        stage('Install Requirements'){
            steps{
                sh "pip3 install -r requirements.txt"
            }
        }

        stage('Lint Code'){
            steps {
                sh "bash ./run_pylint.sh"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t udacity-devops-capstone .'
            }
        }

         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "goldin2008"]) {
                      sh "docker tag udacity-devops-capstone goldin2008/udacity-devops-capstone"
                      sh 'docker push goldin2008/udacity-devops-capstone'
                  }
              }
         }

        stage('Build Green Docker Image') {
            steps {
                script{
                    greenDockerImage = docker.build "goldin2008/green-flask-app"
                }
            }
        }

        stage('Upload Green Image'){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        greenDockerImage.push()
                    }
                }
            }
        }

        stage('Clean Up Green Image'){
            steps { 
                sh "docker rmi goldin2008/green-flask-app:latest" 
            }
        }

        stage('Build Blue Docker Image') {
            steps {
                script{
                    blueDockerImage = docker.build "goldin2008/blue-flask-app"
                }
            }
        }

        stage('Upload Blue Image'){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        blueDockerImage.push()
                    }
                }
            }
        }
    }
}