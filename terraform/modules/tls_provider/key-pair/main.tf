resource "tls_private_key" "key-pair" {
  algorithm = var.algorithm
  rsa_bits  = var.key_size
}
