data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(data.aws_availability_zones.available.zone_ids)
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.zone_ids[count.index]
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(data.aws_availability_zones.available.zone_ids)
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + 3)
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.zone_ids[count.index]
  tags = {
    Name = "private_subnet"
  }
}