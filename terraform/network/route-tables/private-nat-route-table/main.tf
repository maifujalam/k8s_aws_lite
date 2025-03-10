module "public-default-route-table" {
  source = "../../../modules/network/route-tables/private-nat-route-table"
  region = var.region
  owner = var.owner
  vpc_name = var.vpc_name
  subnet_names = var.subnet_names
  route_table = var.route_table
  instance_name = var.instance_name
}
