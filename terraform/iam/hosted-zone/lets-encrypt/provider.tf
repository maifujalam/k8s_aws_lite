provider "aws" {
  region = var.region
  profile = "default2"
  shared_credentials_files = ["~/.aws/credentials"]
}
