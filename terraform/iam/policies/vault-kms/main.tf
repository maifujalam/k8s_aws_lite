resource "aws_iam_policy" "vault" {
  name   = "vault-policy"
  path   = "/"
  policy = file("vault-policy.json")
}
resource "aws_iam_policy_attachment" "cert_manager_user_policy_attachment" {
  name       = "vault-policy-attachment"
  users      = ["helm-repo-write"]
  policy_arn = aws_iam_policy.vault.arn
}
