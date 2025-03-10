output "public-key" {
  value = tls_private_key.key-pair.public_key_pem
}
output "private-key" {
  value = tls_private_key.key-pair.private_key_pem
}

