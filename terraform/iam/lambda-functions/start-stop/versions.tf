terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.58.0"
    }
  }
  required_version = ">= 1.6.1"
  backend "s3" {
    bucket = "terraform-s3-maifuj"
    key    = "terraform-state/k8s_aws/terraform/iam/lambda-functions/start-stop"   # Hare our state files get stored for this object.
    region = "ap-south-1"
  }
}
