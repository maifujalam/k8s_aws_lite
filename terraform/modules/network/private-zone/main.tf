resource "aws_route53_zone" "private" {
  name = var.private_zone
  vpc {
    vpc_id = data.aws_vpc.get_vpc.id
  }
}
