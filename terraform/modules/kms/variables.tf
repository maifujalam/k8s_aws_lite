variable "region" {
  description = "Region"
}
variable "kms_name" {
  description = "KMS key Name"
}
variable "deletion_window_in_days" {
  default = 7
  description = "How many days the key will be in deletion window,after it is scheduled for deletion"
}
variable "secondary_region" {
  description = "Secondary region as backup "
  default = "us-east-2"
}
