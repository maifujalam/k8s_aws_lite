module "vpc" {
  source = "../../../modules/network/vpc"
  region = var.region
  owner = var.owner
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}
