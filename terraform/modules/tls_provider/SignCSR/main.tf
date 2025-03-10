resource "tls_locally_signed_cert" "sign-cert" {
  cert_request_pem   = var.cert_request_pem
  ca_private_key_pem = var.ca_private_key_pem
  ca_cert_pem        = var.ca_cert_pem

  validity_period_hours = var.validation_hour

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
