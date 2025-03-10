resource "aws_eip" "nat-ip" {
#   instance = "i-0e25a391a1200fdfa"
#   instance = data.aws_instances.nat-instance.ids[0]
  domain = "vpc"
  tags = {
    Name       = var.name
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project    = var.project
  }
}
