variable "region" {
  description = "Region"
}
variable "name" {
  default = "default-tg"
}
variable "project" {
  default = "project-default"
}
variable "owner" {
  default = "skalam"
}
variable "vpc_name" {
  description = "VPC Name"
  default     = "default"
}
variable "port" {
  default = 80
}
variable "protocol" {
  default = "HTTP"
}
variable "health_check_path" {
  default = "/healthz"
}
variable "instance_name" {
  default = "k8s_master-1"
}
variable "load_balancer_name" {
  default = "app-load-balancer"
}
variable "acme_certificate_arn" {
  default = "app-load-balancer"
}
