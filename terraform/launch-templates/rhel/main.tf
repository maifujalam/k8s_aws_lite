module "launch-template-bastion" {
  source        = "../../modules/launch-template"
  name          = var.name
  region        = var.region
  instance_type = var.instance_type
  os            = var.os
  key_name      = var.key_name
}
