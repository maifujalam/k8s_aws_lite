variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "k8s_aws"
}
variable "name" {
  default = "default-tg"
}
variable "start-vm-lambda" {
  type = string
  default = "start-vm-lambda-function"
}
variable "stop-vm-lambda" {
  type = string
  default = "stop-vm-lambda-function"
}
variable "start-cron" {
  type = string
  default = "cron(36 8 * * ? *)"
}
variable "stop-cron" {
  type = string
  default = "cron(38 8 * * ? *)"
}
