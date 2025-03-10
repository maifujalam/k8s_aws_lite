variable "region" {
  description = "Region"
}
variable "name" {
  default = "default-app-load-balancer"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "project-default"
}
variable "vpc_name" {
  default = "default"
}
variable "subnet_names" {
  default = ["subnet-1","subnet-2","subnet-3"]
}
variable "security_group_name" {
  default = "default-sg"
}
