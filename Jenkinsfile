pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/Techtidy/my-app-dev.git", branch: "main"
            }
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t my-app-dev ."
            }
        }
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                sh "docker tag my-app-dev  ${env.dockerhubUser}/my-app-dev :latest"
                sh "docker login -u ${env.dockerhubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerhubUser}/my-app-dev :latest"
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
