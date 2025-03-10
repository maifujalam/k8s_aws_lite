variable "private_key" {
  default = ""
}
variable "common_name" {
  default = "example.maifuj.com"
}
variable "country" {
  default = "IN"
}
variable "locality" {
  default = "Bangalore"
}
variable "organization" {
  default = "MAIFUJ.COM PVT LTD"
}
variable "organization_unit" {
  default = "MAIFUJ.COM example unit"
}
variable "pincode" {
  default = "560008"
}
variable "province" {
  default = "Mahrashatra"
}
variable "validation_hour" {
  description = "Hors certificate valid from noe."
  default = "8640"
}
variable "dns_names" {
  type = list(any)
  default = []
}
variable "ip_addresses" {
  type = list(any)
  default = []
}
