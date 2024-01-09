
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
output "public_security_group_id" {
  value = module.vpc.public_security_group_id
}
output "private_security_group_id" {
  value = module.vpc.private_security_group_id
}
output "private_subnets_id" {
  value = module.vpc.private_subnet_id
}
output "public_subnets_ids" {
  value = module.vpc.public_subnet_id
}

################################################################################
# Bastion Host
################################################################################
module "bastion" {
  source = "./bastion_host"

  subnet_id = module.vpc.public_subnet_id[0]
  security_group_ids = [
    module.vpc.public_security_group_id
  ]
  ssh_key_name = "bastion"
}

################################################################################
# EC2 Instance
################################################################################
module "instance" {
  source = "./instance"

  subnet_id = module.vpc.private_subnet_id[0]
  security_group_ids = [
    module.vpc.private_security_group_id
  ]
  ssh_key_name = "ins01"
}