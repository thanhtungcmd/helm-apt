resource "aws_eip" "nat_eip" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [
    aws_internet_gateway.vpc_gateway
  ]
  tags = {
    Name = "elastic_ip_nat_gateway"
  }
}