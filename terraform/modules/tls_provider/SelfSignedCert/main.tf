resource "tls_self_signed_cert" "self-signed-cert" {
  private_key_pem = var.private_key

  subject {
    common_name         = var.common_name       # CN: Common Name
    country             = var.country           # C: Country
    locality            = var.locality          # L: Locality
    organization        = var.organization      # O: Organization
    organizational_unit = var.organization_unit # OU: Organization Unit
    postal_code         = var.pincode           # PC: Postal Code
    province            = var.province          # ST: State
  }

  validity_period_hours = var.validation_hour

  allowed_uses = [
    "digital_signature",
    "server_auth",
    "cert_signing",
    "crl_signing"
  ]
}
