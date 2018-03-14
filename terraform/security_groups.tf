resource "aws_security_group" "docker_swarm" {
  name = "docker-swarm"

  # Allow connect itself
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "docker-swarm"
    Terraform = "true"
  }
}

resource "aws_security_group" "ssh" {
  name = "ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "ssh"
    Terraform = "true"
  }
}
