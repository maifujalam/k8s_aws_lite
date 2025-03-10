data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_vpc" "get_vpc" {
  tags = {
    Name = var.vpc
  }
}
