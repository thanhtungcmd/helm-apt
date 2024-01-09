# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(local.availability_zones)
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = local.availability_zones[count.index]
  tags = {
    Name = "public_subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(local.availability_zones)
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + 3)
  map_public_ip_on_launch = true
  availability_zone = local.availability_zones[count.index]
  tags = {
    Name = "private_subnet"
  }
}