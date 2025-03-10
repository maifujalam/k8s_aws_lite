resource "aws_subnet" "subnet" {
  vpc_id            = data.aws_vpc.get_vpc.id
  for_each          = var.subnet_az
  availability_zone = each.value
  cidr_block        = var.subnet_cidr[each.key]
  tags = {
    Name       = each.key
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
  }
}
