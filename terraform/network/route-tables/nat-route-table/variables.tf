variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "vpc_name" {
  description = "VPC Name"
  default = "default"
}
variable "instance_name" {
  default = "ubuntu-bastion-nat"
}
variable "route_table" {
  description = "Route Table Name"
}
variable "public_subnet_names" {
  description = "list of public subnets to assign with the route tables"
  default = ["subnet-1"]
}

variable "private_subnet_names" {
  description = "list of private subnets to assign with the route tables"
  default = ["subnet-2", "subnet-3"]
}
