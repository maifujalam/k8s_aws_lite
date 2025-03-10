resource "aws_route_table" "rt" {
  vpc_id = data.aws_vpc.get_vpc.id
  tags = {
    Name = var.route_table
    Owner = var.owner
    Path  = path.cwd
  }
}