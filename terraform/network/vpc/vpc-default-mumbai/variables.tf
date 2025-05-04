variable "region" {
  description = "Region"
  default = "ap-southt-1"
}
variable "owner" {
  default = "alam2"
}
variable "vpc_name" {
    description = "VPC Name"
}
variable "vpc_cidr" {
  description = "the vpc cdir range"
  default = "172.31.0.0/16"
}
