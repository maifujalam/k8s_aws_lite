data "aws_vpc" "get_vpc" {
  tags = {
    Name = var.vpc
  }
}
