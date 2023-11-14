### Creating an AWS Account:

1. Visit the AWS Website:
   - Open a web browser and go to the [AWS homepage](https://aws.amazon.com/).

2. Click on "Create an AWS Account":
   - On the AWS homepage, locate and click on the "Create an AWS Account" button.

3. Fill in the Required Information:
   - Provide your email address and choose a secure password. Click "Next."

4. Fill in Contact Information:
   - Enter your name, address, and phone number. Click "Next" to proceed.

5. Choose an AWS Support Plan:
   - Select a support plan. For beginners, choose the "Basic Plan" which is free. This plan includes 12 months of limited usage for certain AWS services.

6. Enter Payment Information:
   - Provide your credit card information. AWS may charge a small amount to verify your identity, but this is refunded.

7. Verify Your Identity:
   - AWS may call you at the phone number you provided to verify your identity. Follow the instructions provided during the call.

8. Choose a Support Plan:
   - Choose the free support plan or opt for a paid plan if you prefer.

9. Sign in to the AWS Console:
   - Once your account is set up, sign in to the [AWS Management Console](https://aws.amazon.com/console/).

### Creating an EC2 Instance:

1. Navigate to EC2 Dashboard:
   - In the AWS Management Console, go to the "Services" menu, and select "EC2" under the "Compute" section.

2. Launch an Instance:
   - In the EC2 Dashboard, click the "Launch Instance" button.

3. Choose an Amazon Machine Image (AMI):
   - Select an AMI based on your requirements. For example, you might choose an Amazon Linux AMI or an Ubuntu AMI.

4. Choose an Instance Type:
   - Select the type of instance you want to launch. For beginners, a common choice is the "t2.micro" instance, which is part of the free tier.

5. Configure Instance Details:
   - Set instance details such as the number of instances, network settings, etc. You can leave most settings as default for now.

6. Add Storage:
   - Configure the amount and type of storage for your instance. You can specify the size and type of the root volume.

7. Add Tags (Optional):
   - Optionally, add tags to your instance for better organization. Tags are key-value pairs that help you identify your instances.

8. Configure Security Group:
   - Set up security group rules to control inbound and outbound traffic to your instance. This involves specifying the protocols and ports that are allowed.

9. Review and Launch:
   - Review your instance configuration and click "Launch" when you're ready.

10. Select or Create a Key Pair:
    - Choose an existing key pair or create a new one. This key pair is essential for connecting to your instance securely.
    - This will be downladed once we create a new keypair.

11. Launch Instance:
    - Click "Launch Instances" to initiate the instance creation process.

12. View Instances:
    - Navigate to the "Instances" section in the EC2 Dashboard to see the status of your instance. The status will initially be "pending" and will change to "running" once the instance is ready.

Remember to terminate instances when you're done using them to avoid incurring unnecessary charges.

Certainly! Once you have launched your EC2 instance, you can connect to it using SSH for Linux instances or a remote desktop connection for Windows instances. Here's how you can connect to your EC2 instance:

### Connecting to a Linux Instance (using SSH):

1. In the AWS Console:
   - Go to the EC2 Dashboard.

2. Select your Instance:
   - In the Instances section, select the checkbox next to your instance.

3. Click "Connect" Button:
   - With your instance selected, click the "Connect" button at the top.

4. Get Connection Details:
   - In the Connect To Your Instance dialog, you'll see instructions for connecting to your instance. This typically includes the SSH command.

5. Open Terminal:
   - Open a terminal on your local machine (Linux or macOS) or use an SSH client like PuTTY on Windows.

6. Run SSH Command:
   - Run the SSH command provided in the AWS Console, including the path to your private key file. For example:
     ```bash command
     ssh -i /path/to/your/private-key.pem ec2-user@your-instance-ip
     ```
   - Replace `/path/to/your/private-key.pem` with the path to your private key file, and `your-instance-ip` with your instance's public IP address.

### Connecting to a Windows Instance:

1. In the AWS Console:
   - Go to the EC2 Dashboard.

2. Select your Instance:
   - In the Instances section, select the checkbox next to your Windows instance.

3. Click "Connect" Button:
   - With your instance selected, click the "Connect" button at the top.

4. Get Connection Details:
   - In the Connect To Your Instance dialog, you'll see instructions for connecting to your Windows instance. This includes the Public DNS and a password.

5. **Use Remote Desktop:
   - Open the Remote Desktop client on your local machine (you can find it on Windows by searching for "Remote Desktop Connection").

6. Enter Public DNS:
   - Enter the Public DNS of your instance into the "Computer" field.

7. Enter Credentials:
   - Use the username and password provided in the AWS Console to log in.

Note:For Windows instances, you may need to wait a few minutes after launching the instance before attempting to connect, as it takes some time to initialize.

After successfully connecting to your EC2 instance, you'll have access to the operating system, and you can install, configure, and run applications as needed. Remember to follow best practices for security, such as keeping your private key secure and regularly updating your instance.
Make sure the keypair file is in the correct path


To install Docker on your EC2 instance, follow these steps. These instructions assume you are using a Linux-based instance, such as Amazon Linux or Ubuntu.

### Install Docker on a Linux EC2 Instance:

1. Connect to Your EC2 Instance:
   - Use SSH to connect to your Linux instance. For example:
     ```bash
     ssh -i /path/to/your/private-key.pem ec2-user@your-instance-ip
     ```
   - Replace `/path/to/your/private-key.pem` with the path to your private key file, and `your-instance-ip` with your instance's public IP address.

2. Update Package Index:
   - Update the package index to ensure you install the latest version of Docker.
     ```bash
     sudo yum update -y   # For Amazon Linux
     sudo apt-get update   # For Ubuntu
     ```

3. Install Docker:
   - Install Docker using the package manager.
     ```bash
     sudo yum install docker -y   # For Amazon Linux
     sudo apt-get install docker-ce docker-ce-cli containerd.io -y   # For Ubuntu
     ```

4. Start Docker Service:
   - Start the Docker service.
     ```bash
     sudo service docker start
     ```

5. Add the ec2-user to the docker group (Optional, for convenience):
   - Adding the `ec2-user` to the `docker` group allows you to run Docker commands without using `sudo`.
     ```bash
     sudo usermod -aG docker ec2-user
     ```

6. Logout and Log Back In (if you added the user to the docker group):
   - To apply the changes, log out and log back in or run the following command:
     ```bash
     su - ec2-user
     ```

7. Verify Docker Installation:
   - Check that Docker is installed correctly by running the following command:
     ```bash
     docker --version
     ```

### Verify Docker by Running a Test Container:

1. Pull a Docker Image:
   - Pull a simple Docker image as a test. For example, you can use the official Nginx image.
     ```bash
     docker pull nginx
     ```

2. Run a Docker Container:
   - Run a container based on the Nginx image.
     ```bash
     docker run -d -p 80:80 --name mynginx nginx
     ```

   - This command runs a detached Nginx container, maps port 80 on the host to port 80 on the container, and names the container "mynginx."

3. Verify the Running Container:
   - Check the running containers.
     ```bash
     docker ps
     ```

   - You should see information about your running Nginx container.

4. Access Nginx Web Page (Optional):
   - If you mapped port 80 to your EC2 instance, you can access the Nginx welcome page by entering your instance's public IP address in a web browser.

Now, You've successfully installed Docker on your EC2 instance and verified it by running a test container. Remember to manage your Docker containers according to your application requirements.


Certainly! Here's a more detailed step-by-step guide for installing JDK and Jenkins on a Linux-based EC2 instance, specifically using Amazon Linux 2 as an example. Note that you may need to adapt some commands based on the Linux distribution you are using.

### Install JDK on Amazon Linux 2:

1. Connect to Your EC2 Instance:
   - Use SSH to connect to your Amazon Linux 2 instance.
     ```bash
     ssh -i /path/to/your/private-key.pem ec2-user@your-instance-ip
     ```

2. Update Package Index:
   ```bash
   sudo yum update -y
   ```

3. Install JDK 11:
   ```bash
   sudo amazon-linux-extras install java-openjdk11 -y
   ```

4. Verify JDK Installation:
   ```bash
   java -version
   ```

### Install Jenkins on Amazon Linux 2:

1. Download and Install Jenkins Repository Key:
   ```bash
   sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
   sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
   ```

2. Update Package Index:
   ```bash
   sudo yum update -y
   ```

3. Install Jenkins:
   ```bash
   sudo yum install jenkins -y
   ```

4. Start Jenkins Service:
   ```bash
   sudo service jenkins start
   ```

   If it green in color, then Jenkins is installed successfully otherwise try to install it again.

5. Enable Jenkins Service (Optional):
   ```bash
   sudo systemctl enable jenkins
   ```

6. Retrieve Jenkins Initial Admin Password:
   ```bash
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```

   Password will be displayed, paste it in the Jenkins then login.

### Verify Jenkins Installation:

1. Access Jenkins Web Interface:
   - Open a web browser and navigate to `http://your-instance-ip:8080`.(Auto-assigned IP address:8000) from the EC2 instances.

2. Enter Initial Admin Password:
   - Enter the initial admin password obtained from the previous step.

3. Install Suggested Plugins:
   - Choose the option to install suggested plugins. This will install the basic plugins needed for Jenkins.

4. Create Admin User:
   - Provide details to create an admin user for Jenkins.

5. Instance Configuration:
   - Configure the Jenkins instance, or leave the default settings.

6. Start Using Jenkins:
   - Click "Start using Jenkins" to complete the setup.

Now, Jenkins is installed and ready to use on your EC2 instance. You can access the Jenkins web interface and start creating jobs, pipelines, and automating your CI/CD processes.

Remember to secure your Jenkins installation, including setting up authentication and securing the Jenkins URL if your instance is publicly accessible. Additionally, ensure that your security groups and network settings allow access to Jenkins on port 8080.


Creating a Docker Hub account is a straightforward process. Here are step-by-step instructions:

### Create a Docker Hub Account:

1. Visit Docker Hub:
   - Open a web browser and go to [Docker Hub](https://hub.docker.com/).

2. Sign Up:
   - Click on the "Sign Up" button at the top-right corner of the page.

3. Complete the Sign Up Form:
   - Fill in the required information, including your username, email address, and password.
   - Optionally, you can choose to receive Docker news and updates.

4. Agree to Terms of Service:
   - Read and accept the Docker Terms of Service by checking the box.

5. Complete the CAPTCHA:
   - Complete any CAPTCHA or verification process if prompted.

6. Click "Sign Up":
   - Click the "Sign Up" button to create your Docker Hub account.

7. Verify Your Email:
   - Docker Hub will send a verification email to the address you provided. Check your email and click on the verification link to confirm your account.

8. Set Up Your Profile (Optional):
   - Optionally, you can set up your Docker Hub profile by adding a profile picture and providing additional information. This step is not mandatory.

9. Log In:
   - Once your email is verified, go back to the Docker Hub website and click "Log In" at the top-right corner.

10. Enter Credentials:
    - Enter your Docker Hub username and password to log in.

You've successfully created a Docker Hub account. Now you can use your Docker Hub credentials to log in when pushing Docker images or pulling images from the public Docker Hub registry.

Remember to keep your Docker Hub credentials secure, and consider enabling two-factor authentication (2FA) for an additional layer of security.


### Install Docker Plugin in Jenkins:

1. Open Jenkins:
   - Open your Jenkins web interface in a web browser (`http://your-jenkins-ip:8080`).

2. Log In:
   - Log in to your Jenkins instance using your credentials.

3. Navigate to Jenkins Dashboard:
   - Click on "Jenkins" in the top-left corner to go back to the dashboard.

4. Install Docker Plugin:
   - Navigate to "Manage Jenkins" > "Manage Plugins."

5. Go to Available Plugins:
   - In the "Manage Plugins" page, go to the "Available" tab.

6. Search for Docker Plugin:
   - In the "Filter" box, type "Docker" to find the "Docker" plugin.

7. Select Docker Plugin:
   - Select the checkbox next to "Docker" in the list of available plugins.

8. Install without Restart:
   - Click the "Install without restart" button.

9. Restart Jenkins:
   - After the plugin installation is complete, Jenkins will prompt you to restart. Click "Restart Jenkins" when ready.

### Configure Docker Hub Credentials:

1. Open Jenkins:
   - Once Jenkins has restarted, log in again.

2. Navigate to Jenkins Credentials:
   - Go to "Manage Jenkins" > "Manage Credentials."

3. Select (Jenkins) Store:
   - Under the "Stores scoped to Jenkins" section, click on "(Jenkins)" to access global credentials.

4. Add Docker Hub Credentials:
   - Click on "(global)" > "Add Credentials" on the left menu.

   - - Kind: Select "Secret text" if using an access token, or "Username with password" if using a username and password.
   - - Scope: Choose "Global."
   - - ID: Provide a unique ID (e.g., `docker-hub-credentials`).
   - - Secret: Enter the access token or password.
   - - Description:Add a description for the credentials (e.g., "Docker Hub Credentials").

   - Click "OK" to save the credentials.

### Configure Jenkins Job to Use Docker Hub Credentials:

1. Create or Open a Jenkins Job:
   - Create a new Jenkins job or open an existing one.

2. Configure the Job:
   - In the job configuration, find the "Build Environment" section.

3. Add Docker Hub Credentials:
   - Check the option "Use secret text(s) or file(s)" and select the Docker Hub credentials you added.

### Test the Configuration:

1. Save and Build the Job:
   - Save your job configuration and manually trigger a build.

2. Check the Console Output:
   - Examine the console output for any Docker-related steps to ensure that Jenkins can connect to Docker Hub using the configured credentials.

You've configured Jenkins to use Docker Hub credentials for interacting with Docker images and containers during your Jenkins jobs. This setup is useful for tasks such as building Docker images, pushing images to Docker Hub, or pulling images from Docker Hub within your Jenkins pipeline or job.


In Jenkins, you typically write pipeline scripts using the Pipeline DSL (Domain-Specific Language). These scripts define your CI/CD process, including building, testing, and deploying applications. Here's a step-by-step guide on how to write a simple Jenkins pipeline script:

### Write a Jenkins Pipeline Script:

1. Open Jenkins:
   - Open your Jenkins web interface in a web browser (`http://your-jenkins-ip:8080`).

2. Log In:
   - Log in to your Jenkins instance using your credentials.

3. Navigate to Jenkins Dashboard:
   - Click on "Jenkins" in the top-left corner to go back to the dashboard.

4. Create a New Item:
   - Click on "New Item" to create a new Jenkins job or pipeline.

5. Enter a Name:
   - Enter a name for your pipeline (e.g., "MyPipeline").

6. Select Pipeline:
   - Choose "Pipeline" as the job type.

7. Click OK:
   - Click "OK" to create the pipeline job.

8. Configure Pipeline Script:
   - Scroll down to the "Pipeline" section, and in the "Definition" dropdown, choose "Pipeline script."

9. Write Pipeline Script:
   - In the "Script" section, you can write your pipeline script. For a simple example, you can use the following script:
     ```groovy
     pipeline {
         agent any
         
         stages {
             stage('Build') {
                 steps {
                     echo 'Building...'
                     // Your build commands go here
                 }
             }
             
             stage('Test') {
                 steps {
                     echo 'Testing...'
                     // Your test commands go here
                 }
             }
             
             stage('Deploy') {
                 steps {
                     echo 'Deploying...'
                     // Your deployment commands go here
                 }
             }
         }
     }
     ```

10. Save:
    - Save your pipeline configuration.

### Run the Pipeline:

1. Run the Pipeline:
   - On the pipeline's main page, click "Build Now" to manually trigger a build.

2. Monitor the Build:
   - Click on the build number to see the build progress.
   - In the build console output, you can see the progress of each stage in your pipeline.

### Check for Errors:

1. Console Output:
   - If the build fails, the console output will show the error messages.
   - Click on the build number, and then click "Console Output" to view the detailed log.

2. View Stage Logs:
   - In the pipeline visualizer or the Blue Ocean interface, you can view logs for each stage individually.

3. Pipeline Syntax (Optional):
   - In Jenkins, you can also use the "Pipeline Syntax" tool to validate and generate pipeline steps. Go to "Jenkins" > "Pipeline Syntax," and select the desired step to generate the syntax.

By following these steps, you've created and executed a simple Jenkins pipeline. You can modify the script to fit your specific CI/CD requirements. The console output and logs are essential for troubleshooting and identifying errors during the build process.


To check whether the Docker image is successfully pushed to Docker Hub in your Jenkins pipeline, you can use the following steps. These steps assume you have already configured Docker Hub credentials in Jenkins and have a stage in your pipeline responsible for building and pushing the Docker image.

### Update Jenkins Pipeline Script:

1. Add Docker Hub Credentials:
   - Ensure that your Jenkins pipeline script includes the Docker Hub credentials. You can use the `withCredentials` block to securely access your Docker Hub credentials in the pipeline script.

   ```groovy
   pipeline {
       agent any

       stages {
           stage('Build and Push Image') {
               steps {
                   script {
                       // Docker Hub credentials
                       withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                           
                           // Build and tag the Docker image
                           sh 'docker build -t your-docker-username/your-repo-name:latest .'
                           
                           // Log in to Docker Hub
                           sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                           
                           // Push the Docker image to Docker Hub
                           sh 'docker push your-docker-username/your-repo-name:latest'
                       }
                   }
               }
           }
       }
   }
   ```

   Make sure to replace `your-docker-username/your-repo-name` with your Docker Hub username and repository name.

2. Save and Run the Pipeline:
   - Save your updated pipeline script and trigger a new build.

3. Check the Console Output:
   - After the build is complete, click on the build number and navigate to "Console Output."

4. Verify Image Push:
   - Look for messages in the console output indicating the successful login and push to Docker Hub. For example:
     ```
     ...
     [Pipeline] {
     [Pipeline] withCredentials
     Masking supported pattern matches of $DOCKER_PASSWORD
     [Pipeline] {
     [Pipeline] script
     [Pipeline] {
     [Pipeline] sh
     [your-pipeline] Running shell script
     + docker push your-docker-username/your-repo-name:latest
     The push refers to repository [docker.io/your-docker-username/your-repo-name]
     ...
     ```

### Check Docker Hub:

1. Visit Docker Hub:
   - Open your web browser and navigate to [Docker Hub](https://hub.docker.com/).

2. Log In:
   - Log in to Docker Hub using your Docker Hub credentials.

3. Check Repository:
   - Go to your Docker Hub repository and verify that the latest image tag has been pushed.

If the pipeline execution was successful, and there are no errors in the console output, and you can see the image on Docker Hub, it indicates that the Docker image has been successfully pushed to Docker Hub by your Jenkins pipeline.

Here's a detailed step-by-step guide to installing Docker Compose and verifying the installation on a Unix-like system (Linux or macOS):

### Install Docker Compose:

1. Download the Docker Compose Binary:
   - Open a terminal window.

   - Run the following command to download the Docker Compose binary:
     ```bash
     sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     ```
     This command downloads the latest version of Docker Compose based on your operating system and architecture.

2. Apply Execute Permissions:
   - Apply execute permissions to the Docker Compose binary:
     ```bash
     sudo chmod +x /usr/local/bin/docker-compose
     ```
     This command gives execute permissions to the binary, allowing it to be run as a command.

3. Verify Installation:
   - Check if Docker Compose is installed successfully by running:
     ```bash
     docker-compose --version
     ```
     This command should display the version of Docker Compose installed on your system.

### Verify Docker Compose Installation:

After installing Docker Compose, you can verify the installation by running a simple command:

```bash
docker-compose --version
```

This command should output something like `docker-compose version 1.29.2`, indicating that Docker Compose is installed and displaying its version.

Now, let's create a simple `docker-compose.yml` file and use it to start a sample application:


1. Create a Docker Compose File:
   - Open a text editor and create a file named `docker-compose.yml`.

   - Add the following content to the file:
     ```yaml
     version: '3'
     services:
       web:
         image: nginx:latest
         ports:
           - "8080:80"
     ```
     This `docker-compose.yml` file defines a service named "web" using the latest version of the Nginx image, mapping port 8080 on the host to port 80 on the container.

2. Run Docker Compose:
   - Save the `docker-compose.yml` file.

   - Open a terminal and navigate to the directory containing the `docker-compose.yml` file.

   - Run the following command to start the services defined in the file:
     ```bash
     docker-compose up
     ```
     This command creates and starts the Nginx container based on the configuration in the `docker-compose.yml` file.

3. Access the Web Application:
   - Open a web browser and navigate to `http://localhost:8080`. You should see the default Nginx welcome page.

4. Stop the Services:
   - To stop the running services, go back to the terminal where `docker-compose up` is running and press `Ctrl+C`.

If you can successfully create and run a Docker Compose file and access the web application, it indicates that Docker Compose is installed and working on your system. Adjust the steps accordingly if you're using a different operating system.

**Docker Compose** is a tool for defining and running multi-container Docker applications. It allows you to define a multi-container Docker application in a single file, `docker-compose.yml`, and then spin up and manage the entire application stack with a single command.

### docker-compose.yml:

The `docker-compose.yml` file is a YAML file that defines the services, networks, and volumes for a Docker application. It specifies how the containers should be configured, how they should communicate with each other, and any other configurations needed for the application to run.

Here's a simple example of a `docker-compose.yml` file:

```yaml
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
  db:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: examplepassword
```

In this example, there are two services defined (`web` and `db`). The `web` service uses the latest version of the Nginx image and maps port 8080 on the host to port 80 on the container. The `db` service uses the latest version of the MySQL image and sets the root password as "examplepassword."

### docker-compose up:

The `docker-compose up` command is used to start the defined services specified in the `docker-compose.yml` file. It creates and starts containers based on the specified configurations.

Example:
```bash
docker-compose up
```

### docker-compose down:

The `docker-compose down` command is used to stop and remove the containers, networks, and volumes defined in the `docker-compose.yml` file. It essentially tears down the entire application stack.

Example:
```bash
docker-compose down
```

### Use Cases:

- Development Environments:
  - Docker Compose is often used in development environments to define and run a set of interconnected services needed for an application.

- Microservices Architecture:
  - Docker Compose is useful when dealing with microservices, as it allows you to define and manage the entire stack of services that make up an application.

- Testing and CI/CD:
  - It is commonly used in testing environments and CI/CD pipelines to spin up containers with the required configurations.

### Summary:

- docker-compose.yml: Defines the configuration of a multi-container Docker application.
- docker-compose up: Starts the services specified in the `docker-compose.yml` file.
- docker-compose down: Stops and removes the containers, networks, and volumes specified in the `docker-compose.yml` file.

Using Docker Compose simplifies the process of managing complex multi-container applications, making it easier to reproduce environments and deploy applications consistently across different environments.


Configuring Jenkins with GitHub through webhooks allows you to trigger Jenkins builds automatically whenever there is a new commit or a pull request in your GitHub repository. This integration helps automate your CI/CD pipeline, making the development and deployment process more efficient. Below are the step-by-step instructions on how to set up Jenkins and GitHub integration using webhooks:

### Configure GitHub Webhook:

1. Create a GitHub Personal Access Token:
   - Go to your GitHub account settings.
   - Navigate to "Developer settings" > "Personal access tokens."
   - Generate a new token with the "repo" scope.

2. Copy the Token:
   - Once generated, copy the generated token. You'll need this token to configure the Jenkins GitHub plugin.

### Configure Jenkins:

1. Install GitHub Plugin:
   - Open Jenkins and go to "Manage Jenkins" > "Manage Plugins."
   - In the "Available" tab, search for "GitHub" and install the "GitHub" plugin.

2. Configure GitHub in Jenkins:
   - Go to "Manage Jenkins" > "Configure System."
   - Scroll down to the "GitHub" section.
   - Click on "Add GitHub Server" and provide the following details:
     - **Name:** Give it a name (e.g., "GitHub").
     - **API URL:** Leave it blank for GitHub.com. If you're using GitHub Enterprise, provide the API URL.
     - **Credentials:** Click "Add" to add your GitHub personal access token as a secret text credential.

3. Test GitHub Connection:
   - Click "Test Connection" to ensure Jenkins can connect to your GitHub repository using the provided credentials.

4. Configure GitHub Webhook in Jenkins:
   - In the "GitHub" section of the Jenkins system configuration, find the "Webhooks" section.
   - Check the box for "Let Jenkins auto-manage hook URLs."
   - Click "Save."

### Configure GitHub Repository:

1. Add Jenkins Integration in GitHub Repository:
   - Go to your GitHub repository.
   - Navigate to "Settings" > "Webhooks" > "Add webhook."

2. Webhook Configuration:
   - Set the Payload URL to `http://your-jenkins-url/github-webhook/`.
   - Content type should be `application/json`.
   - Set the webhook to trigger for just the "push" event or additional events as needed.
   - Provide the secret (optional) if you configured it in Jenkins.
   - Click "Add webhook."

### Verify the Setup:

1. Make a Change in Your GitHub Repository:
   - Make a new commit, push a change, or create a pull request in your GitHub repository.

2. Check Jenkins Build Trigger:
   - In Jenkins, go to the project where you want to enable GitHub triggers.
   - Click on "Configure" for the job.
   - Under the "Build Triggers" section, check "GitHub hook trigger for GITScm polling."

3. Run the Jenkins Job:
   - Push the changes again or create a pull request to trigger the Jenkins build.

4. Check Build Status:
   - After a short delay, Jenkins should automatically start a build triggered by the GitHub webhook.
   - Check the build status and console output in Jenkins.

By following these steps, you've configured Jenkins with GitHub through webhooks. This setup ensures that Jenkins automatically builds your project whenever there is a new commit or pull request in your GitHub repository.
