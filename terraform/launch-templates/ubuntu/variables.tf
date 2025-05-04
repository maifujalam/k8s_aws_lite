variable "region" {
  description = "Region"
}
variable "key_name" {
  default = "deault_rsa"
}
variable "name" {
  default = "default-launch-template"
}
variable "block_device_name" {
  default = "/dev/sda"
}
variable "block_device_size" {
  default = "20"
}
variable "delete_on_termination" {
  default = "true"
}
variable "volume_type" {
  default = "gp3"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "os" {
  default     = "ubuntu-2404"
  description = "It can be one of ubuntu-2404,ubuntu-2204,rhel9"
}
