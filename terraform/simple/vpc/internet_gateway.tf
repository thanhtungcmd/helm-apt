resource "aws_internet_gateway" "vpc_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "internet_gateway"
  }
}