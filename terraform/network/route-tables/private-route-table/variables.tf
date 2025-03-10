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
variable "nat_gateway" {
  description = "NAT Gateway name"
  default = "k8s_aws_nat "
}

variable "route_table" {
  description = "Route Table Name"
}
variable "subnet_names" {
  description = "list of pubic subnets to assign with the default(public) route tables"
  default = ["subnet-1", "subnet-2"]
}
