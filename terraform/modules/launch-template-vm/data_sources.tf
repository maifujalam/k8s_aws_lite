
data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}
data "aws_subnet" "selected_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }

  # Optional filters to narrow down the subnet
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]  # Adjust this to match your target subnet's tag
  }
}
data "aws_security_group" "selected_security_group" {
  filter {
    name = "tag:Name"
    values = [var.security_group]
  }
}
