pipeline {
    agent any
    environment {
        DOCKERFILE = 'docker/Dockerfile'
        DOCKER_IMAGE_NAME = 'Techtidy'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Git Checkout') {
            steps {
                // Manual Git checkout using Windows command
                bat(script: 'git checkout main', returnStatus: true)
                bat(script: 'git pull', returnStatus: true)
            }
        }

        stage('Compile') {
            steps {
                script {
                    // Use 'mvn compile' to compile the project.
                    bat(script: 'mvn compile', returnStatus: true)
                }
            }
        }


        stage('Build') {
            steps {
                script {
                    // Build the project using 'mvn package' and skip tests.
                    bat(script: 'mvn clean package -DskipTests=true', returnStatus: true)
                }
            }
        }

        stage('Docker Build and Push') {
            steps {
                script {
                    // Build the Docker image and tag it.
                    bat(script: "docker build -t %DOCKER_IMAGE_NAME% -f %DOCKERFILE% .", returnStatus: true)
                    bat(script: "docker tag %DOCKER_IMAGE_NAME% username/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG%", returnStatus: true)
                    bat(script: "docker push username/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG%", returnStatus: true)
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container.
                    bat(script: "docker run -d --name Techtidy-e_waste -p 8070:8070 username/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG%", returnStatus: true)
                }
            }
        }
    }
}
