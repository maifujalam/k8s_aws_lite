output "self-signed-cert" {
  value = tls_self_signed_cert.self-signed-cert.cert_pem
}
