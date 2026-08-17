module "kms" {
  source         = "../../modules/kms"
  region         = var.region
  owner          = var.owner
  project        = var.project
  kms_name       = var.kms_name
  kms_name_alias = var.kms_name_alias
  deletion_window_in_days = var.deletion_window_in_days
}
