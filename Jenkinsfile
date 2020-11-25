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

        stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
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

        // stage ('Cloning Git') {
        //     steps {
        //         git 'https://github.com/goldin2008/project-devops-capstone.git'
        //     }
        // }

        // stage('Build Image') {
        //     steps {
        //         script {
        //             sh 'docker build --tag=goldin2008/devops-capstone .'
        //         }
        //     }
        // }

        // stage('Deploy Image') {
        //     steps {
        //         script {
        //             withDockerRegistry([ credentialsId: "docker-hub"]) {
        //             sh 'docker push goldin2008/devops-capstone'
        //             }
        //         }
        //     }
        // }

        // stage('Set K8S Context'){
        //     steps {
        //         withAWS(credentials:'aws-credentials'){
        //             sh "kubectl config set-context arn:aws:eks:us-east-2:319947095944:cluster/production"
        //         }
        //     }
        // }

        // stage('Build Green Docker Image') {
        //     steps {
        //         script{
        //             greenDockerImage = docker.build "goldin2008/pre-production-flask-app"
        //         }
        //     }
        // }

        // stage('Upload Green Image to Docker-Hub'){
        //     steps{
        //         script{
        //             docker.withRegistry('', registryCredential){
        //                 greenDockerImage.push()
        //             }
        //         }
        //     }
        // }

        // stage('Clean Up Green Image'){
        //     steps { 
        //         sh "docker rmi goldin2008/pre-production-flask-app:latest" 
        //     }
        // }

        // stage('Green Deployment'){
        //     steps {
        //         withAWS(credentials:'aws-credentials'){
        //             sh "kubectl apply -f k8s/Green/green-deployment.yaml && kubectl apply -f k8s/Green/test-service.yaml"
        //         }
        //     }
        // }

        // stage('Test Green Deployment'){
        //     steps{
        //         input "Deploy to production?"
        //     }
        // }

        // stage('Switch Traffic To Green Deployment'){
        //     steps{
        //         withAWS(credentials:'aws-credentials'){
        //             sh "kubectl apply -f k8s/Green/green-service.yaml"
        //         }
        //     }
        // }

        // stage('Build Blue Docker Image') {
        //     steps {
        //         script{
        //             blueDockerImage = docker.build "goldin2008/flask-app"
        //         }
        //     }
        // }

        // stage('Upload Blue Image to Docker-Hub'){
        //     steps{
        //         script{
        //             docker.withRegistry('', registryCredential){
        //                 blueDockerImage.push()
        //             }
        //         }
        //     }
        // }

        // stage('Clean Up Blue Image'){
        //     steps { 
        //         sh "docker rmi goldin2008/flask-app:latest" 
        //     }
        // }

        // stage('Blue Deployment'){
        //     steps {
        //         withAWS(credentials:'aws-credentials'){
        //             sh "kubectl apply -f k8s/Blue"
        //         }
        //     }
        // }
    }
}