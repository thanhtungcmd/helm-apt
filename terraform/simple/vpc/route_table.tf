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
  count = length(data.aws_availability_zones.available.zone_ids)
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
}