#!/bin/bash

# Install the Java Development Kit
sudo apt-get update
sudo apt-get install openjdk-11-jdk

# Add the Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
	/usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
	https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
	/etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the apt configuration
sudo apt update

# Install Jenkins
sudo apt-get install jenkins

# Start Jenkins
sudo systemctl start jenkins

# Open Jenkins in your browser
echo "Jenkins is installed and running on port 8080. Open http://localhost:8080 in your browser to start configuring Jenkins."
