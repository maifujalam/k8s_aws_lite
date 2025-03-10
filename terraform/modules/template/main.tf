resource "resource_type" "resource_type" {
  tags = {
    Name = var.name
    Owner      = var.owner
    CreatedBy  = "terraform"
    ModulePath = path.module
    CWD        = path.cwd
    Project = var.project
  }
}
