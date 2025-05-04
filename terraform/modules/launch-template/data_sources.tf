data "aws_ami" "ubuntu-2204" {
  most_recent = true
  owners      = ["self", "amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ami" "ubuntu-2404" {
  most_recent = true
  owners      = ["self", "amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ami" "rhel-9" {
  most_recent = true
  owners      = ["self", "amazon"]
  filter {
    name   = "name"
    values = ["RHEL-9*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
data "aws_key_pair" "get_key_lookup" {
  key_name = var.key_name
  filter {
    name   = "tag:Name"
    values = [var.key_name]
  }
}
