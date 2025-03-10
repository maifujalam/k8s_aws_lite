resource "aws_route_table" "rt-private" {
  vpc_id = data.aws_vpc.selected_vpc.id
  tags = {
    Name = var.route_table
    Owner = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateway.get_nat_gateway.id
  }
}
resource "aws_route_table_association" "rt-private" {
  route_table_id = aws_route_table.rt-private.id
  for_each = data.aws_subnet.selected_subnet
  subnet_id = each.value.id
}
