variable "region" {
  description = "Region"
}
variable "key_name" {
  default = "default-key"
}
variable "public_key" {
  default =  "~/.ssh/id_rsa.pub"
}
variable "owner" {
  default = "alam2"
}

