module "nat-gateway" {
  source = "../../modules/network/nat-gateway"
  owner = var.owner
  project = var.project
  subnet = var.subnet
  nat_gateway = var.nat_gateway
}
