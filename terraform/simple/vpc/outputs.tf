output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_security_group_id" {
  value = aws_security_group.public.id
}

output "private_security_group_id" {
  value = aws_security_group.private.id
}

output "public_subnet_id" {
  depends_on = [
    aws_subnet.public_subnet
  ]
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet_id" {
  depends_on = [
    aws_subnet.private_subnet
  ]
  value = aws_subnet.private_subnet.*.id
}