resource "aws_lb" "application_load_balancer" {
  name                       = var.name
  internal                   = false
  load_balancer_type         = "application"
  security_groups = [data.aws_security_group.selected_security_group.id]
  subnets                    = [for subnet in data.aws_subnet.selected_subnet : subnet.id]
  enable_deletion_protection = false

  tags = {
    name       = var.name
    owner      = var.owner
    Project    = var.project
    createdBy  = "terraform"
    modulePath = path.module
    CWD        = path.cwd
  }
}
