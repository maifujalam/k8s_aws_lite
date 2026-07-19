provider "aws" {
  region = var.region
  profile = "aws-main"
  shared_credentials_files = ["~/.aws/credentials"]
}
