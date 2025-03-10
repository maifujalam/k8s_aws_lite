module "nat-instance" {
  source = "../../modules/network/elastic-ip"
  region = var.region
  owner = var.owner
  project = var.project
  vm-name = var.vm-name
}
