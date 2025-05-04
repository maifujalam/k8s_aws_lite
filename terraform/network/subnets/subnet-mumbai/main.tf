module "default-mumbai-subnet" {
  source = "../../../modules/network/subnets"
  region = var.region
  owner = var.owner
  vpc    = var.vpc_name
  subnet_az = var.subnet_az
  subnet_cidr = var.subnet_cidr
}
