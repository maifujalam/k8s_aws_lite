module "target-group-http" {
  source = "../../modules/network/target-group"
  region = var.region
  owner = var.owner
  name = var.name
  project = var.project
  instance_name = var.instance_name
  port = var.port
  protocol = var.protocol
  health_check_path = var.health_check_path
}
