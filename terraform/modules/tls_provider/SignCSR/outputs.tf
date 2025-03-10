output "signed-cert" {
  value = tls_locally_signed_cert.sign-cert.cert_pem
}
