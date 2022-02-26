provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "local_amazon_ubuntu" {
  ami           = "ami-033b95fb8079dc481"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.local.id]

  tags = {
    Name    = "My_Amazon_Ubuntu"
    Owner   = "Far Muratov"
    project = "Devops"
  }
}

resource "aws_instance" "global_ubuntu" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name    = "My_Ubuntu"
    Owner   = "Far Muratov"
    project = "Devops"
  }

}


// Security Group-Global
resource "aws_security_group" "web" {
  name        = "WebServer-SG"
  description = "SG for Devops project"


  // ICMP, TCP/22, 80, 443, and any outgoing access. 
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

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { //This ensures internet connection
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}


// Security Group-Local
resource "aws_security_group" "local" {
  name        = "WebServer-SG-local"
  description = "SG for Devops project for local connection"


  // ICMP, TCP/22, 80, 443, and any outgoing access. 
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

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }




}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpYlqhND5zREh0bDnW6FKzG34qVfd+dzZwvwK56IqMgwEhHTC8Er/XF+NHV5RPscuJ8Hj7rdJ7wBsvwVytQqOebwmFQsqjgirNxYUwXzhHOsqKV9PwUsM05yj2gWux9rQD2Rx1P6OFCEJdMRFO2oNA2TYjBKKDa2nW78nPdi0GrcA6o0/X4InIfqbC8OfCs7eGJdvXBhK8OcC3c/HaqPC/XyZkL33ACT7BGNzhbKeIv/h/Q0wy29Ey2SJtuD7hswUFLry3M2n5z/gZ44HjpgbyPYx1WcML/7yKYCDA93C7tj6Zi86w2CyjUZX8d3SgGE1zG6NDBE+gLpDXg7GrLH9L undefeated@Muzaffarbeks-MacBook-Air.local"

}
