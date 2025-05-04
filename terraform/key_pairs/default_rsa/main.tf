module "key_pair" {
  source = "../../modules/keypair"
  region = var.region
  key_name = var.key_name
  public_key = var.public_key
  owner = var.owner
}
