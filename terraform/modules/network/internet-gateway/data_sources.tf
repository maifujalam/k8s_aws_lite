data "aws_vpc" "get_vpc" {
    filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}
