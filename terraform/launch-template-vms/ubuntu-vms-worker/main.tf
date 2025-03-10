module "ubuntu-vms" {
  source           = "../../modules/launch-template-vm"
  region           = var.region
  project = var.project
  instance_name    = var.instance_name
  vm_count         = var.vm_count
  enable_public_ip = var.enable_public_ip
  launch_template  = var.launch_template
  root_volume_size = var.root_volume_size
  vpc_name = var.vpc_name
  subnet_name = var.subnet_name
  spot_instance = var.spot_instance
  instance_type = var.instance_type
  private_ip       = var.private_ip
  security_group = var.security_group
  iam_instance_profile = var.iam_instance_profile
  source_dest_check = var.source_dest_check
}

