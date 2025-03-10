data "aws_instances" "nat-instance" {
  filter {
    name   = "tag:Name"           # Filter by the Name tag
    values = ["ubuntu-vm-nat-1"]
  }
}
