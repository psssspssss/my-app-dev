provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Specify the AMI ID of the EC2 instance
  instance_type = "t2.micro"             # Specify the instance type

  tags = {
    Name = "example-instance"
  }
}
