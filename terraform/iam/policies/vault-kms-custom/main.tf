resource "aws_iam_policy" "vault" {
  name   = "vault-kms-custom"
  path   = "/"
  policy = file("vault-kms-custom.json")
}
resource "aws_iam_policy_attachment" "vault-kms-custom-ec2-full_access_policy_attachment" {
  name = "vault-kms-custom-ec2-full_access-policy-attachment"
  roles = [
    "ec2-full-assume-role"
  ]
  policy_arn = aws_iam_policy.vault.arn
}
