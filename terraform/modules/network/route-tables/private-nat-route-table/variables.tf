variable "region" {
  description = "Region"
}
variable "project" {
  default = "project-default"
}
variable "vpc_name" {
  description = "VPC Name"
  default = "default"
}
variable "route_table" {
  description = "Route Table Name"
}
variable "owner" {
  description = "Owner of the module"
}
variable "instance_name" {
  default = "ubuntu-bastion-nat"
}
variable "subnet_names" {
  description = "list of pubic subnets to assign with the default(public) route tables"
  default = ["subnet-3"]
}
