variable "region" {
  description = "Region"
}
variable "kms_name" {
  description = "KMS key Name"
}
variable "kms_name_alias" {
  description = "KMS key alias"
  default     = "sample-key-alias"
}
variable "deletion_window_in_days" {
  default     = 7
  description = "How many days the key will be in deletion window,after it is scheduled for deletion"
}
variable "secondary_region" {
  description = "Secondary region as backup "
  default     = "us-east-1"
}
variable "owner" {
  default = "skalam"
}
variable "project" {
  default = "k8s_aws"
}