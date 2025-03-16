module "kms" {
  source = "../../modules/kms"
  region = var.region
  owner = var.owner
  project = var.project
  kms_name = var.kms_name
}
