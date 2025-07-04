data "aws_eip" "get-eip" {
  filter {
    name   = "tag:Name"
    values = [var.elastic_ip]
  }
}
data "aws_instances" "nat-instance" {
  depends_on = [module.ubuntu-vms]
  filter {
    name   = "tag:Name"           # Filter by the Name tag
    values = [var.instance_name]
  }
}
