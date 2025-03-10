output "id" {
  value = tls_cert_request.csr.id
}
output "csr_file" {
  value = tls_cert_request.csr.cert_request_pem
}
output "private_key_file" {
  value = tls_cert_request.csr.private_key_pem
}
