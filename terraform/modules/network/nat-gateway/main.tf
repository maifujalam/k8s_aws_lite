resource "aws_eip" "eip" {
  tags = {
    Name       = var.eip
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }
}
resource "aws_nat_gateway" "nat" {
  subnet_id     = data.aws_subnet.selected_subnet.id
  allocation_id = aws_eip.eip.id
  tags = {
    Name       = var.nat_gateway
    EIP        = aws_eip.eip.public_ip
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }
  private_ip = var.nat_private_ip
}
