
module "instance" {
  source = "./instance"
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block = var.vpc_cidr_block
}