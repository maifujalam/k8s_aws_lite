provider "aws" {
  region = var.region
  profile = "alam"
}
provider "aws" {
  alias = "secondary_region"
  region = var.secondary_region
  profile = "alam"
}