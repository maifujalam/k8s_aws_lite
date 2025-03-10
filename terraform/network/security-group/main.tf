module "k8s-security-group" {
  source = "../../modules/network/security-group"
  region = var.region
  owner = var.owner
  name = var.name
  project = var.project
  vpc = var.vpc
}
