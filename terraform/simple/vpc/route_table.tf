# Public Route Table
resource "aws_route_table" "vpc_public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "vpc_public_route_table"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.vpc_public_route_table.id
  gateway_id = aws_internet_gateway.vpc_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.vpc_public_route_table.id
  count = length(local.availability_zones)
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
}

# Private Route Table
resource "aws_route_table" "vpc_private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "vpc_private_route_table"
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.vpc_private_route_table.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.vpc_private_route_table.id
  count = length(local.availability_zones)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
}