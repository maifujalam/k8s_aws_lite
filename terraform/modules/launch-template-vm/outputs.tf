output "public_ip" {
  value = flatten(aws_instance.vm[*].public_ip)
}
output "private_ip" {
  value = flatten(aws_instance.vm[*].private_ip)
}
output "instance_type" {
  value = aws_instance.vm[*].instance_type
}

