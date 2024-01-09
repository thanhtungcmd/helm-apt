# Public subnet
resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port = 0
    to_port = 0
    action = "allow"
    rule_no = 100
    protocol = "-1"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    from_port = 0
    to_port = 0
    action = "allow"
    rule_no = 100
    protocol = "-1"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_network_acl_association" "public" {
  count = length(local.availability_zones)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  network_acl_id = aws_network_acl.public.id
}

# Private subnet
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port = 0
    to_port = 0
    action = "allow"
    rule_no = 100
    protocol = "-1"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    from_port = 0
    to_port = 0
    action = "deny"
    rule_no = 100
    protocol = "-1"
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    from_port = 22
    to_port = 22
    action = "allow"
    rule_no = 1
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_network_acl_association" "private" {
  count = length(local.availability_zones)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  network_acl_id = aws_network_acl.private.id
}