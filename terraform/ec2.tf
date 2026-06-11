resource "aws_security_group" "allow_all" {
  name        = "allow-all-terraform"
  description = "Allow all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-00e801948462f718a"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name    = "Hello"
    Project = "roboshop"
  }
}


