#data "aws_eip" "get_eip" {
#  public_ip = ""
#  tags = {
#    Name = var.eip
#  }
#}
data "aws_vpc" "selected_vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "selected_subnet" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }

  # Filter by subnet name
  filter {
    name = "tag:Name"
    values = [var.subnet]
  }
}
