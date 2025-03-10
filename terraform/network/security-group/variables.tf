variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "name" {
  default = "object-name-default"
}
variable "project" {
  default = "k8s_aws"
}
variable "ingress_ports" {
  default = ["22", "80", "443", "8080"]
}
variable "vpc" {
  description = "VPC Name"
  default = "deffault"
}
