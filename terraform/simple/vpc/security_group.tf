# Public Security Group
resource "aws_security_group" "public" {
  vpc_id = aws_vpc.vpc.id
  name = "public_security_group"
  description = "public_security_group"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_security_group"
  }
}

# Private Security Group
resource "aws_security_group" "private" {
  vpc_id = aws_vpc.vpc.id
  name = "private_security_group"
  description = "private_security_group"

  ingress {
    description = "allow_ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.public_ip_cidr]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_security_group"
  }
}