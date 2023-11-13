pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/vandana-dsu/my-app-dev-1-demo.git", branch: "main"
            }
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t techtidy ."
            }
        }
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                sh "docker tag techtidy ${env.dockerhubUser}/techtidy:latest"
                sh "docker login -u ${env.dockerhubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerhubUser}/techtidy:latest"
                }
            }
        }
        stage("Deploy"){
            steps {
                echo "Deploying the container"
                //sh "docker run -d -p 8000:8000 techtidy/my-note-app:latest"
                sh "docker-compose down && docker-compose up -d"
                
            }
        }
    }
}
