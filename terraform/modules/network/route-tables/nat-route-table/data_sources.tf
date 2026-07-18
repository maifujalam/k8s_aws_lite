# data "aws_instances" "nat-instance" {
#   filter {
#     name   = "tag:Name"           # Filter by the Name tag
#     values = [var.instance_name]
#   }
# }
data "aws_instance" "current" {
#   depends_on = [data.aws_instances.nat-instance]
    filter {
    name   = "tag:Name"           # Filter by the Name tag
    values = [var.instance_name]
  }
}
data "aws_vpc" "selected_vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}
data "aws_subnet" "selected_private_subnet" {
  for_each = toset(var.private_subnet_names)
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
data "aws_subnet" "selected_public_subnet" {
  for_each = toset(var.public_subnet_names)
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
data "aws_internet_gateway" "get_ig" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.selected_vpc.id]  # or the actual VPC ID
  }
}