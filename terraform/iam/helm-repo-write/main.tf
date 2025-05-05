resource "aws_iam_policy" "lets-encrypt" {
  name   = "lets-encrypt-policy"
  path   = "/"
  policy = file("lets-encrypt-policy.json")
}
resource "aws_iam_policy_attachment" "cert_manager_user_policy_attachment" {
  name       = "cert-manager-policy-attachment"
  users      = ["helm-repo-write"]
  policy_arn = aws_iam_policy.lets-encrypt.arn
}
