resource "aws_instance" "app_server" {
  ami           = "ami-07ad6a955c4978e2d"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}