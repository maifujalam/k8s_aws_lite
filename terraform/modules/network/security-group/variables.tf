variable "region" {
  description = "Region"
}
variable "name" {
  default = "object-name-default"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "project-default"
}
variable "ingress_ports" {
  default = ["22", "80", "443", "8080"]
}
variable "vpc" {
  description = "VPC Name"
  default = "default"
}
