
resource "tls_cert_request" "csr" {
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
  dns_names = var.dns_names
  ip_addresses = var.ip_addresses

}
