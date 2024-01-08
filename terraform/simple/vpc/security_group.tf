resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.vpc.id
  name = "allow_ssh"
  description = "allow_ssh"

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
    Name = "security_group_allow_ssh"
  }
}