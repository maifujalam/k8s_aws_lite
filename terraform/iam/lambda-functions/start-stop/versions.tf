terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.66.0"
    }
  }
  required_version = ">= 1.6.1"
  backend "s3" {
    bucket = "terraform-backend-alam2"
    key    = "terraform-state/k8s_aws/terraform/iam/lambda-functions/start-stop"   # Hare our state files get stored for this object.
    region = "ap-south-1"
  }
}
