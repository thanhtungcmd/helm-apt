resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = element(aws_subnet.private_subnet.*.id, 0)
  depends_on = [
    aws_internet_gateway.vpc_gateway
  ]
}