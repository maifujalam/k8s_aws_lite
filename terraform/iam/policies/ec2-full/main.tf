resource "aws_iam_policy" "ec2-full" {
  name   = "ec2-full-policy"
  path   = "/"
  policy = file("ec2-full-policy.json")
}
resource "aws_iam_role" "ec2-full-iam-role" {
  name = "ec2-full-assume-role"
  assume_role_policy = file("ec2-full-role.json")
}
resource "aws_iam_policy_attachment" "ec2-full_policy_attachment" {
  name       = "ec2-full-policy-attachment"
  roles      = [aws_iam_role.ec2-full-iam-role.name]
  policy_arn = aws_iam_policy.ec2-full.arn
}
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-full-assume-role"
  role = aws_iam_role.ec2-full-iam-role.name
}