data "aws_security_group" "selected_security_group" {
  filter {
    name = "tag:Name"
    values = [var.security_group]
  }
}
