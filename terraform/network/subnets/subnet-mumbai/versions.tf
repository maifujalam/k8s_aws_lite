terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.59.0"
    }
  }
  required_version = ">= 1.6.1"
  backend "s3" {
    bucket = "terraform-backend-alam"
    key    = "terraform-state/terraform/network/subnets/subnet-mumbai"   # Hare our state files get stored for this object.
    region = "ap-south-1"
  }
}
