
################################################################################
# VPC Module
################################################################################
module "vpc" {
  source = "./vpc"

  vpc_cidr_block = var.vpc_cidr_block
  public_ip_cidr = var.public_ip_cidr
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "security_group_id" {
  value = module.vpc.security_group_id
}
output "private_subnets_id" {
  value = module.vpc.private_subnet_id
}
output "public_subnets_ids" {
  value = module.vpc.public_subnet_id
}


################################################################################
# EC2 Instance
################################################################################
module "instance" {
  source = "./instance"

  subnet_id = module.vpc.private_subnet_id[0]
  security_group_ids = [
    module.vpc.security_group_id
  ]
  ssh_key_name = "ins01"
}