provider "aws" {
  region = "us-east-1"
}

# Create a security group for the EC2 instance
resource "aws_security_group" "my_security_group" {
  name_prefix = "my-ec2-sg"

  # Define inbound rules to allow SSH (port 22) and HTTP (port 80) traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  tags = {
    Name = "my-igw"
  }
}

# Launch an EC2 instance with provisioner "remote-exec"
resource "aws_instance" "my_ec2" {
  ami           = "ami-05c13eab67c5d8861"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "hello"  # Replace with your SSH key pair
  security_groups = [aws_security_group.my_security_group.name]

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate user for your AMI
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install httpd",
      "sudo service httpd start",
      "sudo echo '<html><head><title>Test Page</title></head><body><h1>It's running!</h1></body></html>' > /var/www/html/index.html",
      "sudo chmod 644 /var/www/html/index.html",
      "sudo service httpd restart",
    ]
  }
}

# Attach the internet gateway to the VPC
resource "aws_vpc_attachment" "my_vpc_attachment" {
  vpc_id             = aws_default_vpc.default.id
  internet_gateway_id = aws_internet_gateway.my_internet_gateway.id
}

output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}
