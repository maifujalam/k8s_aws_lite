variable "subnet" {
  description = "Subnet Name"
}
variable "region" {
  description = "Region"
}
variable "vpc_name" {
  default = "default"
}
variable "nat_gateway" {
  description = "NAT Gateway name"
  default = "default-nat"
}
variable "owner" {
  description = "Owner Name"
}
variable "eip" {
  description = "Default EIP ID"
  default = "default-elasic-ip"
}
variable "nat_private_ip" {
  default = "172.31.0.4"
}
variable "project" {
  default = "k8s_aws"
}
