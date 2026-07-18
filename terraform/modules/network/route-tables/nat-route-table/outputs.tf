output "public-route-table-name" {
  value = aws_route_table.nat-public-route-table.tags
}
output "private-route-table-name" {
  value = aws_route_table.nat-private-route-table.tags
}