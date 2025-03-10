output "eip_ip" {
  value = aws_eip.nat-ip.public_ip
}
