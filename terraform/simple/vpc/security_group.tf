resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.vpc.id
  name = "allow_ssh"
  description = "allow ssh"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = []
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}