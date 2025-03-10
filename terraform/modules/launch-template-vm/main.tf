locals {
  aws_subnet=var.subnet_name
}

resource "aws_instance" "vm" {
  count = var.vm_count
  launch_template {
    name = var.launch_template
  }
  subnet_id = data.aws_subnet.selected_subnet.id
  instance_type = var.instance_type
  associate_public_ip_address = var.enable_public_ip
  private_ip = var.private_ip != "" ? format(
    "%s.%s.%s.%d",
    split(".", var.private_ip)[0],  # First octet
    split(".", var.private_ip)[1],  # Second octet
    split(".", var.private_ip)[2],  # Third octet
    tonumber(split(".", var.private_ip)[3]) + count.index  # Last octet + count.index
  ) : null
  root_block_device {
    volume_size = var.root_volume_size
    delete_on_termination = true
  }
  tags = {
    Name =  var.instance_name
    Owner      = var.owner
    project = var.project
    createdBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
  }
  instance_market_options {
    market_type = var.spot_instance == true ? "spot" : null
    spot_options {
#       instance_interruption_behavior = "stop"
    }
  }
#   security_groups = [var.security_group] # Ony when using default Security group
  vpc_security_group_ids = [data.aws_security_group.selected_security_group.id]
  iam_instance_profile = var.iam_instance_profile
  source_dest_check = var.source_dest_check
  lifecycle {
    ignore_changes = [instance_market_options,associate_public_ip_address]
  }
}
