resource "aws_route_table" "rt-public" {
  vpc_id = data.aws_vpc.selected_vpc.id
  tags = {
    Name = var.route_table
    Owner = var.owner
    Path  = path.cwd
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.get_ig.id
  }
}

resource "aws_route_table_association" "rt-public" {
  route_table_id = aws_route_table.rt-public.id
  for_each = data.aws_subnet.selected_subnet
  subnet_id = each.value.id
}
