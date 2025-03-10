data "aws_security_group" "selected_security_group" {
  filter {
    name = "tag:Name"
    values = [var.security_group_name]
  }
}

data "aws_vpc" "selected_vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "selected_subnet" {
  for_each = toset(var.subnet_names)
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }

  # Filter by subnet name
  filter {
    name = "tag:Name"
    values = [each.value]
  }
}
