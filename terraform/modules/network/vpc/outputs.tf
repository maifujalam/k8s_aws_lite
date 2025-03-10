output "aws_vpc_id" {
  value       = aws_vpc.default.id
  description = "Aws vpc id"
}
output "vpc_name" {
  value = aws_vpc.default.tags
}
