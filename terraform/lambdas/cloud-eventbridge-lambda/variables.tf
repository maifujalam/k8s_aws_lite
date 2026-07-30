variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "k8s_aws"
}
variable "lambda_function_start_vm_name" {
  default = "start-vm-lambda-function"
}
variable "lambda_function_stop_vm_name" {
  default = "stop-vm-lambda-function"
}
variable "lambda_function_start_vm_cron" {
  default = "cron(0 7 * * ? *)"
}
variable "lambda_function_stop_vm_cron" {
  default = "cron(0 23 * * ? *)"
}


