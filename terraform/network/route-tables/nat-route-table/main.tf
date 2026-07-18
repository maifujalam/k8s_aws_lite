module "nat-route-table" {
  source = "../../../modules/network/route-tables/nat-route-table"
  region = var.region
  owner = var.owner
  vpc_name = var.vpc_name
  public_subnet_names = var.public_subnet_names
  private_subnet_names = var.private_subnet_names
  route_table = var.route_table
  instance_name = var.instance_name
}
