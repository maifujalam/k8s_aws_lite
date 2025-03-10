resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.get_vpc.id
  tags = {
    Name       = var.internet_gateway_name
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
  }
}
