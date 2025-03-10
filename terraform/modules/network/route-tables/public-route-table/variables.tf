variable "region" {
  description = "Region"
}
variable "vpc_name" {
  description = "VPC Name"
  default = "default"
}
variable "internet_gateway" {
  description = "Internet Gateway name"
}
variable "route_table" {
  description = "Route Table Name"
}
variable "owner" {
  description = "Owner of the module"
}
variable "subnet_names" {
  description = "list of pubic subnets to assign with the default(public) route tables"
  default = ["subnet-1", "subnet-2"]
}
