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
}
resource "aws_route_table_association" "rt-private" {
  route_table_id = aws_route_table.rt-private.id
  for_each = data.aws_subnet.selected_subnet
  subnet_id = each.value.id
}
resource "aws_route" "nat-instance-association" {
  route_table_id =  aws_route_table.rt-private.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = data.aws_instance.current.network_interface_id
}
