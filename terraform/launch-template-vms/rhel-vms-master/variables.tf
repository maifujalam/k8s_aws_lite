variable "region" {
  description = "Region"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "default-project"
}
variable "private_ip" {
  default = "172.168.16.4"
}
variable "vm_count" {
  default = "1"
}
variable "instance_name" {
  default = "default-instance"
}
variable "enable_public_ip" {
  default = "true"
  description = "Whether it is public vm or private vm"
}
variable "launch_template" {
  default = "bastion-ubuntu"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "root_volume_size" {
  description = "Size of root volume"
  default = 10
}
variable "spot_instance" {
  default = false
}
variable "subnet_name" {
  default = "subnet-1"
}
variable "vpc_name" {
  default = "default"
}
variable "security_group" {
  default = "default-sg"
}
