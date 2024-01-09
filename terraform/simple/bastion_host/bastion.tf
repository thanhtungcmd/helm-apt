resource "aws_instance" "bastion_host" {
  ami           = "ami-07ad6a955c4978e2d"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name = var.ssh_key_name

  tags = {
    Name = "bastion_host_instance"
  }
}