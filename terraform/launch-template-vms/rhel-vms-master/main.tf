module "rhel-vms" {
  source = "../../modules/launch-template-vm"
  region = var.region
  project = var.project
  instance_name = var.instance_name
  vm_count = var.vm_count
  enable_public_ip = var.enable_public_ip
  launch_template = var.launch_template
  root_volume_size = var.root_volume_size
  instance_type = var.instance_type
  private_ip = var.private_ip
  security_group = var.security_group
}

