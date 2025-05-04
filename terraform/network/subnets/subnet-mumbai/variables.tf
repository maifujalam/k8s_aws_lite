variable "region" {
  description = "Region"
}
variable "owner" {
  default = "alam2"
}
variable "subnet_az" {
  description = "Subnet Name"
  type = map(string)
  default = {
    "ap-south-1a" : "subnet-1",
    "ap-south-1b" : "subnet-2",
    "ap-south-1c" : "subnet-3",
  }
}
variable "vpc_name" {
  description = "VPC Name"
  default     = "default"
}
variable "subnet_cidr" {
  description = "Subnet CIDR"
  type = map(string)
  default = {
    "ap-south-1a" : "172.31.0.0/20",
    "ap-south-1b" : "172.31.0.16/20",
    "ap-south-1c" : "172.31.0.32/20",
  }
}
