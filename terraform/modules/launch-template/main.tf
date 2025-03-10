resource "aws_launch_template" "launch_template" {
  name = var.name
  #   block_device_mappings {
  #     device_name = var.block_device_name
  #     ebs {
  #       volume_size = var.block_device_size
  #       volume_type = var.volume_type
  #       delete_on_termination = var.delete_on_termination
  #     }
  #   }
  instance_type = var.instance_type
  image_id      = var.os == "rhel9" ? data.aws_ami.rhel-9.image_id : var.os == "ubuntu2204" ? data.aws_ami.ubuntu-2204.image_id : data.aws_ami.ubuntu-2404.image_id
  key_name      = data.aws_key_pair.get_key_lookup.key_name
  network_interfaces {
    associate_public_ip_address = true
  }
  tags = {
    Name    = var.name
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
  }
}
