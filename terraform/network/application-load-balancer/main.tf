module "application-load-balancer" {
  source              = "../../modules/network/application-load-balancer"
  region              = var.region
  owner               = var.owner
  name                = var.name
  project             = var.project
  security_group_name = var.security_group_name
  vpc_name            = var.vpc_name
  subnet_names        = var.subnet_names

}
