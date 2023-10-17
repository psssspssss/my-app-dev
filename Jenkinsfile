pipeline{
    agent any
    tools{
        jdk 'jdk11'
        maven 'maven3'

    }

    environment {
        SCANNER_HOME= tool 'sonar-scanner'
    }

    stages{

        stage('Git Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/Techtidy/my-app-dev.git'
            }
        }

        stage('COMPILE'){
            steps{
                sh "mvn clean compile -DskipTests=true"
            }
        }

        stage('OWASPScanning'){
            steps{
                dependencyCheck additionalArguments: '--scan ./', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

        stage('Sonarqube'){
            steps{
                withSonarQubeEnv('sonar-sever'){
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Techtidy \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Techtidy'''
                }
            }
        }

        stage('Build'){
            steps{
                sh "mvn clean packed -Dskiplests=true"
            }
        }

        stage('Docker Build and Push'){
            steps{
                script{
                   // ""paste the docker link of pipeline syntax""


                        sh "docker build -t Techtidy -f docker/Dockerfile ."
                        sh "docker tag Techtidy username/Techtidy:latest"// username as given in docker login or while we created or installed the docker
                        sh "docker push username/Techtidy:latest"

                }
            }
        }


        stage('Deploy'){
            steps{
                script{
                   // ""paste the docker link of pipeline syntax""


                        sh "docker run -d --name Techtidy-e_waste -p 8070:8070 username/Techtidy:latest"
                      

                }
            }
        }



    }
}