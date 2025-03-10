module "public-default-route-table" {
  source = "../../../modules/network/route-tables/private-route-table"
  region = var.region
  owner = var.owner
  vpc_name = var.vpc_name
  subnet_names = var.subnet_names
  nat_gateway = var.nat_gateway
  route_table = var.route_table
}
