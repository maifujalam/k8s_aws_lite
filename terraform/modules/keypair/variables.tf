variable "region" {
  description = "Region"
}
variable "key_name" {
  default = "id_rsa"
}
variable "public_key" {
  default =  "~/.ssh/id_rsa.pub"
}
variable "owner" {
  default = "alam2"
}
