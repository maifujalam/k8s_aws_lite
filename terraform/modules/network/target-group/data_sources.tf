data "aws_vpc" "get_vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_instance" "get_vm" {
  filter {
    name = "tag:Name"
    values = [var.instance_name]
  }
}

data "aws_lb" "get_lb" {
  name = var.load_balancer_name
}
# Find a certificate that is issued
data "aws_acm_certificate" "issued" {
  domain   = "*.maifuj.com"
  statuses = ["ISSUED"]
}
