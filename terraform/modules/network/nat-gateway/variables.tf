variable "region" {
  description = "Region"
  default     = "ap-south-1"
}
variable "project" {
  default = "k8s_aws"
}
variable "owner" {
  description = "Owner Name"
}
variable "nat_gateway" {
  description = "NAT Gateway name"
  default     = "default-nat"
}
variable "nat_private_ip" {
  default = "172.31.0.4"
}
variable "eip" {
  description = "Default EIP ID"
  default     = "default-elasic-ip"
}
variable "vpc_name" {
  default = "default"
}
variable "subnet" {
  description = "Subnet Name"
}

