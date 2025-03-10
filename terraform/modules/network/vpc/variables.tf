variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "vpc_name" {
    description = "VPC Name"
}
variable "vpc_cidr" {
  description = "the vpc cdir range"
  default = "172.31.0.0/16"
}
