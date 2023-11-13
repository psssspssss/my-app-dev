pipeline{
    agent any
    
    
    stages{

        stage("Docker-compose install "){
            steps{
                script {
                    sh "apk add docker-compose"
                }
            
        }
        
        stage("Code "){
            steps{
                echo "Clone the code from git"
                git url:"https://github.com/vandana-dsu/my-app-dev-1-demo.git", branch: "main"
            }
            
        }
        
        stage("Build "){
            steps{
                echo "Building the code"
                sh "docker build -t techtidy ."
            }
        }
        
        stage("Push to Docker Hub "){
            steps{
                echo "Pushing the image into docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable: "dockerhubPass",usernameVariable:"dockerhubUser")]){
                sh "docker tag techtidy ${env.dockerhubUser}/techtidy:latest"
                sh "docker login -u ${env.dockerhubUser} -p ${dockerhubPass}"
                sh "docker push ${dockerhubUser}/techtidy:latest"
                }
            }
        }
        
        stage("Deploy "){
            steps{
                echo "Deploying the container"
               // sh "docker compose -d -p8000:8000 techtidy/techtidy:latest"
                sh "docker-compose down && docker-compose up -d"
                
            }
        }
    }
    
}
