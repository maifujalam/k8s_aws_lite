resource "aws_route_table" "nat-private-route-table" {
  vpc_id = data.aws_vpc.selected_vpc.id
  tags = {
    Name = "private-${var.route_table}"
    Owner = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }

}
resource "aws_route_table_association" "rt-private" {
  route_table_id = aws_route_table.nat-private-route-table.id
  for_each = data.aws_subnet.selected_private_subnet
  subnet_id = each.value.id
}

resource "aws_route_table" "nat-public-route-table" {
  vpc_id = data.aws_vpc.selected_vpc.id
  tags = {
    Name = "public-${var.route_table}"
    Owner = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.get_ig.id
  }
}
resource "aws_route_table_association" "rt-public" {
  route_table_id = aws_route_table.nat-public-route-table.id
  for_each = data.aws_subnet.selected_public_subnet
  subnet_id = each.value.id
}
resource "aws_route" "nat-instance-association" {
  route_table_id =  aws_route_table.nat-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = data.aws_instance.current.network_interface_id
}
