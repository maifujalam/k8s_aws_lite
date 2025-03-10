resource "aws_key_pair" "deployer" {
  key_name = var.key_name
  public_key = file(var.public_key)
  tags = {
    Name       = var.key_name
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
  }
}
