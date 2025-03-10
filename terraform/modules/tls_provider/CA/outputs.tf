output "root-certificate" {
  value = tls_self_signed_cert.root-ca.cert_pem
}
